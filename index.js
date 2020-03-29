const puppeteer = require('puppeteer');
const zipCode = '94595';
const headers = {
  // ':authority': 'www.costco.com',
  // ':method': 'GET',
  // ':path': '/.product.100142093.html',
  // ':scheme': 'https',
  'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
  'accept-encoding': 'gzip, deflate, br',
  'accept-language': 'en-US,en;q=0.9',
  'cache-control': 'max-age=0',
  'cookie': `spid=629D5B6B-53FC-4322-92AE-98BF7C762AC8; WRUID21112018=2662542638400104; _cs_ex=1; _cs_c=1; invCheckStateCode=CA; _abck=A39235AADD0A92066A7EA8FE3C0A146B~0~YAAQ3Lfvx+mqAmNwAQAA4sYQeQPUGOn9xkRXZdhs9sxoB23TsPgUH9jCjOiEDFzkkG5b62Q8EJMLNSwF9rN6hiVfVMBFWJuWPCFmCPQ9yGqiCwymWEFCTulicgedLfXp0cmpmbd1WIVLAgsWnaeaOdfGGOYa1loHEAwwthlPNN7+ZM/4xzJeFNsO+nTa/J6FIVuHnq3vKNTnv4wsQ9TsVz9M2ylGwhTfgXa4rS202pWVv9B28bHszfA0tcsfuDkxu5rFpiYsHkjaaJ0bEek4+2svpXIR/ujoZ166x5K1ETcK/ZaVNCJ+7f1FyyrkB+fnSu6902PXMA==~-1~-1~-1; invCheckPostalCode=${zipCode}; akaas_AS01=2147483647~rv=91~id=6c0cbae1bc8125b64e2e40251310a8d7; check=true; AMCVS_97B21CFE5329614E0A490D45%40AdobeOrg=1; s_cc=true; WAREHOUSEDELIVERY_WHS=National%3D00847%2CRegional%3D725-bd; WC_SESSION_ESTABLISHED=true; WC_ACTIVEPOINTER=-1%2C10301; memberPrimaryPostal=${zipCode}; bvUserToken=f8a8fffc1c6a084cfd7c6d89bae2bc26646174653d323032302d30332d3237267573657269643d38656333373864332d623031342d346636312d613539332d36396533386539356533326526656d61696c616464726573733d742e672e77753636313740676d61696c2e636f6d264d656d6265724e756d6265723d313131383839393931303338; rememberedLogonId=%7B%22id%22%3A%22470209609%22%2C%22hash%22%3A%22618c1f9a0838452bbc98ba938467d7d31431f876a25857a99b738db0dd16469ae6a871643d3e2d86f90d76815e3340cc161778d47369bbe88580607d4b3c5ad4%22%7D; checkoutMemberTier=Z00020; rememberedShowMemberItem=1; capp_json=%7B%22coBrandedCreditMax%22%3Afalse%2C%22displayErrorForRenew%22%3Afalse%2C%22displayErrorForCancel%22%3Afalse%2C%22displayErrorForRenewGSHousehold%22%3Afalse%7D; sellpoints_abtesting={}; BVImplnative_review_form=2070_2_0; C_CLIENT_SESSION_ID=1618b642-b53a-451c-b928-4a8afcf9e158; BVBRANDID=aa25be61-9b94-4d88-ac14-f0e67621b253; costco_f_p_LOCATIONS=%7B%22contract%22%3A%7B%22id%22%3A%22%22%2C%22switch%22%3A%22false%22%7D%7D; CriteoSessionUserId=6661fb22bf87420093f51559a1a0d2f1; AKA_A2=A; bm_sz=0E6E92B4AF4C8F764198E41B82AF068A~YAAQlsM9Fx9z/x5xAQAAZ4BdIwdW2rgIXqR8Woya59ZrHFEtD/+UFiFounI11j/sDH2RuL7QdMyxxqWiTU7puWcLm0X79oxk2GBS8KQJ5c4NeVXfzKlYD4aOexGh/29Hjaa6GSjl9DOkDzSvg2CQ/e/hKDqDjP581a+GelGufISC0Pd8IoAZesgcvhAvMaWd; JSESSIONID=000017kf1wlX2roVLSCg9qmhHRP:1cq6ldm56; AMCV_97B21CFE5329614E0A490D45%40AdobeOrg=-330454231%7CMCMID%7C10090593080940494551093760079818609271%7CMCAAMLH-1586041063%7C9%7CMCAAMB-1586041063%7CRKhpRz8krg2tLO6pguXWp5olkAcUniQYPHaMWWgdJ3xzPWQmdj0y%7CMCOPTOUT-1585443463s%7CNONE%7CMCAID%7C2F26C6348515D34D-60000A64613FD366%7CvVersion%7C3.1.2; ak_bmsc=30CC77E3CD24E5277391386F6B4DF2D1173DC396E152000066D67F5EDCB34722~plbL6gwuLcUyf7cUi+caSKBWb6yEQDZF7CV9ZQVa/K5be8qnvSk97p6zK6ACZhO0CSlDwthcE77BOaIL1E2HQX/wvBKK5cL8Oa3gB8j9pJXpVtJiSyj/ctfOOI+VDJ92TkeWbmvxHQUsbzJEWQQNisIUEZ1zxNo0rT8CfEZOcwlCvDSM6GhuUPQdC7YU4FCvZkiMsQ80qAk0sxGe5WjBQLHPqn9tzsdk45C3Eoot4EwuVMaEZg1DtcWCt87SKck46T; sp_ssid=1585436264833; sto__session=1585436265286; C_GOP=eyJncm9jZXJ5T3JkZXJUb3RhbCI6IjM4Ljk5IiwiZ3JvY2VyeUFtb3VudFRvR28iOiIzNi4wMSIsImdyb2NlcnlUaHJlc2hvbGQiOiI3NS4wMCIsImdyb2NlcnlEZWxpdmVyeUZlZSI6IjAuMDAifQ%3D%3D; cartCountCookie=1; WC_PERSISTENT=9LwqC7aWg2cdjGcCF%2BMs20p6iJE%3D%0A%3B2020-03-28+16%3A01%3A06.399_1544819449469-1962_10301_693249627%2C-1%2CUSD%2Cb6Rsvs825RZKcoxD%2FWA%2BG%2Fa1p0SBTcO8i0We1qG4kooTcb7SUYQdIjuig653d%2Ffust5oXRNjb2JdfpA1c%2BAM3g%3D%3D_10301; WC_AUTHENTICATION_693249627=693249627%2CKfWb6zGF0YGfROBDBFQhR44HknM%3D; WC_USERACTIVITY_693249627=693249627%2C10301%2Cnull%2Cnull%2C1585436466400%2Cnull%2Cnull%2Cnull%2Cnull%2Cnull%2CUjQLjWYY7NzsBcRyMs91Kgtp0TEt8%2FZvtVc%2B%2Bt%2Fpviw9PzGeWuiq0KCJOpUExhuODSUibx9IW6BUqoOyF0GqZc%2F6l%2FqQIcXEGPvrZcxoyNN4w4axPPmtzUrhMrJMInFtFAJ2AUMjPHgtw4mfqBh4yI7HfFAj0IVD45uLTk7asEhsTqckVozIHS3hYn2Kex7GXVwJvnYyAC3aa7lnjFnDYmUG3rgAcJscs0PCEngBBTs%3D; ajs_user_id=null; ajs_group_id=null; ajs_anonymous_id=%22619be889-0806-48d0-9f79-be7993cea5bd%22; _instacart_session=UWg1OWVaUHV1b1YzWTFaNU42c2dFN243VTgyalJDQkpiMHQxcUZtaENwYysxT0hhczJzRFVBcThpWG85cENZY0txWDQzMXAzTDRXN3ZxV0hpNFNXSmFEU3Z5ckc5U241ekloNDI1T1FVQkU2UmQvN0gzcXNRdkN6S1Z5R0xHWVQzbUF0dTRJMkN1Vm94bXdrZUdENEhHRUF0V3FwcXB3MWhzUGxwQkZOK2dxbCtWZVVreVNscXppTG1RM1lHNkwvd2NVcHVJczlCTkRtdTJJOURrMDdKa254SFVUZ05SSS9GdjdjaytUS3diVHRIa1l5SXJPQ2kwVGhxSGtIemR6L2x1S2RZTVJOWFJzaHN2MW9kZjRMRHd4QkNBOGp2blBUZkFzQWpXMXhVVWc9LS1GcE5FdHZCcHZRSXBnUHZlRi93cW5RPT0%3D--ce4e9c7ce5b5ff9a317fd3766e34c0f9e55ffb70; amplitude_idundefinedcostco.com=eyJvcHRPdXQiOmZhbHNlLCJzZXNzaW9uSWQiOm51bGwsImxhc3RFdmVudFRpbWUiOm51bGwsImV2ZW50SWQiOjAsImlkZW50aWZ5SWQiOjAsInNlcXVlbmNlTnVtYmVyIjowfQ==; amplitude_id_b87e0e586f364c2c189272540d489b01costco.com=eyJkZXZpY2VJZCI6IjMwMzgzZjUxLTMyZjMtNGU0MC1iMmJiLTNiZWE0NWYyMTE0ZVIiLCJ1c2VySWQiOm51bGwsIm9wdE91dCI6ZmFsc2UsInNlc3Npb25JZCI6MTU4NTQzNjU3NDYwNSwibGFzdEV2ZW50VGltZSI6MTU4NTQzNjU3NDYxNiwiZXZlbnRJZCI6NSwiaWRlbnRpZnlJZCI6Miwic2VxdWVuY2VOdW1iZXIiOjd9; lastAddedProductId=507801; BVBRANDSID=f15386d5-708b-4fb4-a2f1-4a6e38d4140c; client-zip-short=95101; C_LOC=CA; invCheckCity=Walnut%20Creek; s_sq=%5B%5BB%5D%5D; bm_sv=BC09278283F5876A4541243248A9C83D~ybhCbjwcsZpbymCBVLq9uGsMAocA40ggKy1BC+20X1jIpviTWmWknyrw+drBMvsOjN24gx/UqdMivTyQCrJo5Y9VxYM0mSkgo1bvc+pG0BK7SrKXC4HrLEu5cFVIiws1Zly7ywMoax7s68SAvGf8A8X1Cl7CDKvP+nJzlGODL90=; sto__count=22; __CT_Data=gpv=59&ckp=tld&dm=costco.com&apv_59_www33=59&cpv_59_www33=59&rpv_59_www33=33; ctm={'pgv':8302902053247811|'vst':3056794490810994|'vstr':4395669631139363|'intr':1585439521652|'v':1|'lvst':622}; mbox=PC#ae9b80ff58dc4362a59e0b1570ef1920.28_0#1645823906|session#10cd359217864196992fe58d3ec7604d#1585441383; RT="z=1&dm=www.costco.com&si=32b01fa5-30ad-4c92-b106-57c6fcfcbf00&ss=k8c7xl9k&sl=i&tt=8ed&obo=d&rl=1&ld=1tnxh&r=2ab823857ce9355feef9db79e0c041ef&ul=1tnxi"`,
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
      user: ENV['GMAIL_USER'],
      pass: ENV['GMAIL_PW']
    }
  });

  const mailOptions = {
    from: ENV['GMAIL_USER'],
    to: ENV['TO_EMAIL'],
    subject: 'TP',
    text: 'https://www.costco.com/kirkland-signature-bath-tissue%2c-2-ply%2c-425-sheets%2c-30-rolls.product.100142093.html'
  };

  return await transporter.sendMail(mailOptions);
}

const check = async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.setViewport({
    width: 1440,
    height: 4000
  });
  await page.setJavaScriptEnabled(true);
  await page.setRequestInterception(true);
  page.on('request', interceptedRequest => {
    // console.log(interceptedRequest.url());
    if (interceptedRequest.url().includes('AjaxGet')) {
      console.log('here');
    }
    interceptedRequest.continue();
  });
  await page.setExtraHTTPHeaders(headers);
  await page.goto('https://www.costco.com/kirkland-signature-bath-tissue%2c-2-ply%2c-425-sheets%2c-30-rolls.product.100142093.html');
  const b = await page.waitForSelector('body');
  const k = await page.$('body')
  await page.screenshot({path: 'file.png'});

  const zipInput = await page.waitForSelector('#delivery-zip', {
  });
  await page.$eval('#delivery-zip', el => el.value = 94595);

  await page.screenshot({path: 'file2.png'});
  const kd = await page.waitForSelector('#submit-delivery-area');
  const ht = await page.$eval('#submit-delivery-area', e => e.outerHTML);
  console.log(ht)

  await page.evaluate(() => {
    document.querySelector('a.marketing-button').click();
  });

  // const [response] = await Promise.all([
  //   page.waitForNavigation(),
  //   page.click('#submit-delivery-area')
  // ]);

  // await page.screenshot({path: 'file3.png'});

  // const hrefElement = await page.$('#add-to-cart');
  // const className = await hrefElement.getProperty('className');
  // console.log(await className.jsonValue())
  // if (className.includes('out-of-stock')) {
  //   console.log('Out of stock!');
  // } else {
  //   console.log('In stock!');
  //   await sendEmail();
  //   // clearInterval(timer);
  // }
};
check().then(() => {
  console.log('fond')
}).catch((e) => {
  console.error(e)
  console.log('nop')
});


