const puppeteer = require('puppeteer');
const zipCode = process.env.ZIP_CODE;
const headers = {
  // ':authority': 'www.costco.com',
  // ':method': 'GET',
  // ':path': '/.product.100142093.html',
  // ':scheme': 'https',
  'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
  'accept-encoding': 'gzip, deflate, br',
  'accept-language': 'en-US,en;q=0.9',
  'cache-control': 'max-age=0',
  'cookie': `RT="z=1&dm=www.costco.com&si=32b01fa5-30ad-4c92-b106-57c6fcfcbf00&ss=k8cen5i1&sl=8&tt=4dv&obo=5&rl=1&ld=j4iv&r=2ab823857ce9355feef9db79e0c041ef&ul=j4iw`,
  'sec-fetch-dest': 'document',
  'sec-fetch-mode': 'navigate',
  'sec-fetch-site': 'none',
  'sec-fetch-user': '?1',
  'upgrade-insecure-requests': '1',
  'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36',
};
const sendEmail = async () => {
  const nodemailer = require('nodemailer');

  const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: process.env.GMAIL_USER,
      pass: process.env.GMAIL_PW
    }
  });

  const mailOptions = {
    from: process.env.GMAIL_USER,
    to: process.env.TO_EMAIL,
    subject: 'TP',
    text: process.env.COSTCO_URL
  };

  return await transporter.sendMail(mailOptions);
}

const check = async () => {
  const opts = {
    args: [
      '--disable-web-security',
    ]
  };
  if (process.env.BROWSER_PATH) {
    opts.executablePath = process.env.BROWSER_PATH;
  }
  const browser = await puppeteer.launch(opts);
  const page = await browser.newPage();
  await page.setViewport({
    width: 1440,
    height: 1000
  });
  await page.setJavaScriptEnabled(true);
  await page.setExtraHTTPHeaders(headers);
  await page.goto(process.env.COSTCO_URL);

  try {
    await page.waitForSelector('#delivery-zip');
    console.log('delivery zip here')
    await page.type('#postal-code-input', zipCode, {delay: 100})
    console.log('Clicking submit zipcode')
    const [response] = await Promise.all([
      page.click('#postal-code-submit'),
      page.waitForNavigation({
        timeout: 60000,
      }),
    ]);
    console.log('Page reloaded');
  } catch (e) {
    console.log('No zip form. Look for add cart');
  }
  try {
    console.log('Looking for add to cart');
    await page.waitForSelector('#add-to-cart', {
      timeout: 10000
    });
    console.log('Looking for quantity');

    await page.waitForSelector('#qty-input', {
      visible: true,
      timeout: 20000,
    });
    console.log('add to cart')
    await page.click('#add-to-cart-btn');
    await page.waitForSelector('.added-to-cart', { visible: true , timeout: 30000});
  } catch (e) {
    browser.close();
    throw e;
  }
};

const start = async () => {
  while (true) {
    try {
      await check();
      console.log('In stock!');
      await sendEmail();
      break;
    } catch (e) {
      console.error(e);
      console.log('Out of stock!');
    }
  }
}

const wait = async (ms) => {
  const p = new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
  return p;
}


start();
