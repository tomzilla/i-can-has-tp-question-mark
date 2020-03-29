require 'open3'
require 'json'
require 'mail'
options = {
  address: 'smtp.gmail.com',
  port: 587,
  user_name: ENV['GMAIL_USER'],
  password: ENV['GMAIL_PW'],
  authentication: 'plain',
  enable_starttls_auto: true
}

Mail.defaults do
  delivery_method :smtp, options
end

def send_email
  Mail.deliver do
    to ENV['TO_EMAIL']
    from ENV['GMAIL_USER']
    subject 'TP'
    body 'TP: https://www.costco.com/kirkland-signature-bath-tissue%2c-2-ply%2c-425-sheets%2c-30-rolls.product.100142093.html'
  end
end
cmd = "curl 'https://www.costco.com/AjaxGetContractPrice?itemId=507802&catalogId=10701&productId=507801&WH=725-bd' -H 'authority: www.costco.com' -H 'accept: application/json, text/javascript, */*; q=0.01' -H 'sec-fetch-dest: empty' -H 'x-requested-with: XMLHttpRequest' -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'referer: https://www.costco.com/.product.100142093.html' -H 'accept-language: en-US,en;q=0.9' -H $'cookie: C_LOC=CA; AKA_A2=A; akaas_AS01=2147483647~rv=57~id=2a5646ea110b89d50bf12210c3e92bae; bm_sz=44FA24EF766583022F97C3B1B482039E~YAAQlsM9F9M1AB9xAQAA7bypIwdCZBFAQzIWzi492xsZYguDyQzKWBdcChgyrTm9pYA9jJit+zICkBwga3/Fjq3PMWLDePyZFmkCnmYehCbwj4Mp9uX+I8jbkFjIZEDQZz9Hvvet/P9glXCxLUDjVlChHj+gH53LpzDXgl/t/RynuknJ+cuuOZ22oBf23hiV; _abck=40A8F77149E0468769BA390816E988BC~-1~YAAQlsM9F9Q1AB9xAQAA7bypIwNQTc3aqo5yOoJTRRivOgvx0NoIrDQg7eCEVdf0ex4nhQrMWxI5YCs6Ahu/58hRRhxsLRgEZfEEETEZ9fUpWP2SzcZxpXqcJXj08YiTO2J0lr/7Ul+7o8HOReq5itW1xpDi+LuL6lUxudjbuFJS7CdYyrBKKQ009pJDNFvbExuQRqqJIHI7xopZjVzEV4ba1/jgOMxJpketHu5UAFP3DfsLN/a7HqPPFFd/9SM61+bh/h6PHmoBz9ee0dGu46yjnFCPWl0spg+M4ecisjD13RwgFiOiSq6t~-1~-1~-1; check=true; AMCVS_97B21CFE5329614E0A490D45%40AdobeOrg=1; CriteoSessionUserId=8011a934-8e70-44b3-a13c-6253e69c2fc7; AMCV_97B21CFE5329614E0A490D45%40AdobeOrg=-330454231%7CMCMID%7C61795994227087313910082480753871538620%7CMCAAMLH-1586046059%7C9%7CMCAAMB-1586046059%7C6G1ynYcLPuiQxYZrsz_pkqfLG9yMXBpb2zX5dvJdYQJzPXImdj0y%7CMCOPTOUT-1585448459s%7CNONE%7CMCAID%7CNONE%7CvVersion%7C3.1.2; s_cc=true; JSESSIONID=0000cx_8SIisNHbcnYKShx785ha:175b160ek; invCheckStateCode=CA; WAREHOUSEDELIVERY_WHS=National%3D00847%2CRegional%3D725-bd; WC_SESSION_ESTABLISHED=true; WC_PERSISTENT=sLPXKfribFpg9Iiuw2QeuoX3kTg%3D%0A%3B2020-03-28+17%3A20%3A59.696_1585441259691-215915_10301_-1002%2C-1%2CUSD%2C%2F2rKzY7%2FAkBfG3fMVX9r0glcSVFxwVyct0TJBAzBYMio9r83rQ2lQ8Nsr1G4FYM2Ahzms1ZuAUWnarbI7G2E5A%3D%3D_10301; WC_AUTHENTICATION_-1002=-1002%2C5M9R2fZEDWOZ1d8MBwy40LOFIV0%3D; WC_ACTIVEPOINTER=-1%2C10301; WC_USERACTIVITY_-1002=-1002%2C10301%2Cnull%2Cnull%2Cnull%2Cnull%2Cnull%2Cnull%2Cnull%2Cnull%2ClU7I7IVwxzTGT%2FO%2FeImufK%2BhYaL4UwgE41VIukPqWWBohJud3G2sevfrw9qsrMw1Ekc%2BcPR9%2BkAO70VoDwk9FiNTEdplLfVxQV64Vb8aBJLz6SSyezJlcvk7Y5Bk5K3MYmcgFg6Kn6Yun5OlKiUulv7R1fFF6MH69goi6e0usKEPBqxyfNyOUU9cvM64DGK%2BUXrxDS4Skm6JnCyrOsRq2g%3D%3D; WC_GENERIC_ACTIVITYDATA=[12600281714%3Atrue%3Afalse%3A0%3A6rzM7jv2R2Js2g1JMTKebwUlXCg%3D][com.ibm.commerce.context.entitlement.EntitlementContext|4000000000000001002%253B60523%2660509%253B60519%253B60507%253B60529%253B60517%253B60539%253B60505%253B60527%253B60515%253B60537%253B60503%253B60525%253B60513%253B60535%253B60501%253B60523%253B4000000000000001002%253B60511%253B60533%253B60521%26null%26-2000%26null%26null%26null][com.ibm.commerce.context.audit.AuditContext|1585441259691-215915][com.ibm.commerce.context.globalization.GlobalizationContext|-1%26USD%26-1%26USD][com.ibm.commerce.store.facade.server.context.StoreGeoCodeContext|null%26null%26null%26null%26null%26null][com.ibm.commerce.catalog.businesscontext.CatalogContext|10701%26null%26false%26false%26false][com.ibm.commerce.context.experiment.ExperimentContext|null][com.ibm.commerce.context.ExternalCartContext|null][CTXSETNAME|Store][com.ibm.commerce.context.base.BaseContext|10301%26-1002%26-1002%26-1][com.ibm.commerce.giftcenter.context.GiftCenterContext|null%26null%26null]; mboxEdgeCluster=28; ak_bmsc=7916BF43C6465A8100FE414D27F4AE82173DC396E1520000EAE97F5EF0147901~plX1QiCL0zUT5rp4mME5+V24RcsR6C/R3Aw2CdQd4feOVn+Gk2sebRXkmkQRf44MJs20MuXh/8xIQTqr6Ys6nZ29/Gb1GE38KrBmR3eF02M1kCUb6C/fiaTYNpFQWtkfWx50ChEb6oLM7ZbrEXXkcgfO8AVhK9BMlfMq/+x0IBbgEPl9YodACp9AiUylDcTAjgZIXVcjnSpjzJ4UlHq29p6t5QWcv1pfUpnGfgHxBMSjOcT6zy9Ugb7+SHKsEcfdf3; spid=8A0AFFC3-A3DD-4EB0-A21D-1EA23FC327A3; sp_ssid=1585441260343; ctm={\'pgv\':507738730029619|\'vst\':1208056852649303|\'vstr\':5659509742285910|\'intr\':1585441261192|\'v\':1}; WRUID21112018=2709436191195768; sto__session=1585441261367; sto__count=0; __CT_Data=gpv=2&ckp=tld&dm=costco.com&apv_59_www33=2&cpv_59_www33=2&rpv_59_www33=1; sellpoints_abtesting={}; _cs_ex=1; _cs_c=1; BVImplnative_review_form=2070_2_0; BVBRANDID=ef0d1110-9f52-40e6-b83b-c4d963e7a11d; BVBRANDSID=c54ced6b-2155-4bab-9bb7-e3beb9af96c5; client-zip-short=94595; invCheckPostalCode=94595; bm_sv=CA21CD1573ADC47A9AA34DAE1B219339~ybhCbjwcsZpbymCBVLq9uGc4tP8xB6UVBCrIPgsqxOMU3Di7YtJoFI0G/g4Qk5dxc5OQ8GH+T2C3Q0b9mTd3OU8jZfTBUoZoXYjZm14si5O/X1jAOej4kaQxpUrDqM1gkMUGvYN6ZZiibHnyWejgIEA1MXVHEUHZDZrPZOl+f3w=; RT=\"z=1&dm=www.costco.com&si=ywm512q69ca&ss=k8casgfa&sl=2&tt=1fh&obo=1&rl=1\"; mbox=session#48d66631e87b43d5900c1a4cd8fcdc4c#1585443137|PC#48d66631e87b43d5900c1a4cd8fcdc4c.28_0#1648686061' --compressed"

loop do
  stdout, = Open3.capture3(cmd)
  response = JSON.parse(stdout.strip)
  puts response
  if response['invAvailable']
    send_email
    break
  else
    puts 'Nope'
    sleep 10
  end
end
