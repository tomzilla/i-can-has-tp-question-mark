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
cmd = "curl 'https://www.costco.com/AjaxGetContractPrice?itemId=507802&catalogId=10701&productId=507801&WH=725-bd' -H 'authority: www.costco.com' -H 'accept: application/json, text/javascript, */*; q=0.01' -H 'sec-fetch-dest: empty' -H 'x-requested-with: XMLHttpRequest' -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'referer: https://www.costco.com/kirkland-signature-bath-tissue%2c-2-ply%2c-425-sheets%2c-30-rolls.product.100142093.html' -H 'accept-language: en-US,en;q=0.9' -H $'cookie: spid=629D5B6B-53FC-4322-92AE-98BF7C762AC8; WRUID21112018=2662542638400104; _cs_ex=1; _cs_c=1; invCheckStateCode=CA; _abck=A39235AADD0A92066A7EA8FE3C0A146B~0~YAAQ3Lfvx+mqAmNwAQAA4sYQeQPUGOn9xkRXZdhs9sxoB23TsPgUH9jCjOiEDFzkkG5b62Q8EJMLNSwF9rN6hiVfVMBFWJuWPCFmCPQ9yGqiCwymWEFCTulicgedLfXp0cmpmbd1WIVLAgsWnaeaOdfGGOYa1loHEAwwthlPNN7+ZM/4xzJeFNsO+nTa/J6FIVuHnq3vKNTnv4wsQ9TsVz9M2ylGwhTfgXa4rS202pWVv9B28bHszfA0tcsfuDkxu5rFpiYsHkjaaJ0bEek4+2svpXIR/ujoZ166x5K1ETcK/ZaVNCJ+7f1FyyrkB+fnSu6902PXMA==~-1~-1~-1; invCheckPostalCode=94595; wcMember=026e2c2947137883b0dac9efa0947ac4%2C1%2CZ00020%2CZ010%2C1%2C1%2CE0002%2CDEFAULT%2C111889991038; AKA_A2=A; akaas_AS01=2147483647~rv=91~id=6c0cbae1bc8125b64e2e40251310a8d7; bm_sz=ACA034F2905A3AC9DE6BDABD788AB542~YAAQsMM9F3+gtBtxAQAAhGGzHAefpSR6/HZ5vLBMN1pj+JMC12EoNMrWiy5lH7GeZH91ehcLhcGKMaQpmiibkCzD4AtpHbXiik8ccyW5qI7FPEiwilPQTcr4QYWF02eZ76tqPWJ0Cu+vX2eFDBpl5Sy2Cv+G5DLQ9jRrcWgVpsALnI1boL0PimqwImZXj5dI; check=true; AMCVS_97B21CFE5329614E0A490D45%40AdobeOrg=1; AMCV_97B21CFE5329614E0A490D45%40AdobeOrg=-330454231%7CMCMID%7C10090593080940494551093760079818609271%7CMCAAMLH-1585929251%7C9%7CMCAAMB-1585929251%7CRKhpRz8krg2tLO6pguXWp5olkAcUniQYPHaMWWgdJ3xzPWQmdj0y%7CMCOPTOUT-1585331651s%7CNONE%7CMCAID%7C2F26C6348515D34D-60000A64613FD366%7CvVersion%7C3.1.2; s_cc=true; ak_bmsc=02C4C6E112C350629CD26912D8A6DD2C173DC3B027740000A2217E5EC810E25C~plzJu15XUKHpZ1vCa235M3jvt89fYKfpY9bmy6FI3gxLOEwKlmwiTk/Lxt3pAcQboNWS2Yj+0BrgY3RbckFHOm3HYYLzzlWlA3erbPJGQWDIWOABhFEAW7yX6y4tCfShhSZZCqmllUY52te19+K8nYxXS0uJS3n2mb5Xp2LzBKA/+x/xsv4FrcakAEDiXOXBxuXD1R/c2/umYGmBTNWTL7lVFhqRPelELSMS2eDwNbpSujAymEmcXNhoiF6uZi+9TB; WRIgnore=true; JSESSIONID=0000f5bpApSKyHizWweLJoD9WJZ:1cq6ldm56; WAREHOUSEDELIVERY_WHS=National%3D00847%2CRegional%3D725-bd; WC_SESSION_ESTABLISHED=true; WC_ACTIVEPOINTER=-1%2C10301; sp_ssid=1585324454839; CriteoSessionUserId=089b97dde61742a9bae9288eb82cff3b%2Cf8ca1bdd7a836afdad2b48b27ffca106; rrDisabledPref=0; rrStoreFlag=1; hashedUserId=026e2c2947137883b0dac9efa0947ac4; memberPrimaryPostal=94595; memberPrimaryStateCode=CA; cartCountCookie=0; bvUserToken=f8a8fffc1c6a084cfd7c6d89bae2bc26646174653d323032302d30332d3237267573657269643d38656333373864332d623031342d346636312d613539332d36396533386539356533326526656d61696c616464726573733d742e672e77753636313740676d61696c2e636f6d264d656d6265724e756d6265723d313131383839393931303338; rememberedLogonId=%7B%22id%22%3A%22470209609%22%2C%22hash%22%3A%22618c1f9a0838452bbc98ba938467d7d31431f876a25857a99b738db0dd16469ae6a871643d3e2d86f90d76815e3340cc161778d47369bbe88580607d4b3c5ad4%22%7D; checkoutMemberTier=Z00020; rememberedShowMemberItem=1; mSign=1; WC_PERSISTENT=hS8L5zRrqAaFqT5p7injhGhv0Nc%3D%0A%3B2020-03-27+08%3A58%3A40.262_1544819449469-1962_10301; WC_AUTHENTICATION_470209609=470209609%2C%2Bsn3Q2zQwnUB9WOTNJbK2XKgL04%3D; sto__session=1585324722160; capp_json=%7B%22coBrandedCreditMax%22%3Afalse%2C%22displayErrorForRenew%22%3Afalse%2C%22displayErrorForCancel%22%3Afalse%2C%22displayErrorForRenewGSHousehold%22%3Afalse%7D; sellpoints_abtesting={}; BVImplnative_review_form=2070_2_0; C_CLIENT_SESSION_ID=1618b642-b53a-451c-b928-4a8afcf9e158; BVBRANDID=aa25be61-9b94-4d88-ac14-f0e67621b253; BVBRANDSID=ed2f8f6e-66fa-49cd-a8a4-e2f2a2e02847; s_sq=%5B%5BB%5D%5D; lastAddedProductId=1849105; client-zip-short=95101; C_LOC=CA; RT=\"z=1&dm=www.costco.com&si=32b01fa5-30ad-4c92-b106-57c6fcfcbf00&ss=k8ad8xg6&sl=i&tt=chr&obo=8&rl=1\"; sto__count=17; ctm={\'pgv\':4355088767534146|\'vst\':486738552595645|\'vstr\':4395669631139363|\'intr\':1585325568710|\'v\':1|\'lvst\':9230}; __CT_Data=gpv=30&ckp=tld&dm=costco.com&apv_59_www33=30&cpv_59_www33=30&rpv_59_www33=28; mbox=PC#ae9b80ff58dc4362a59e0b1570ef1920.28_0#1645823906|session#c2ef20ce6e574c4cab0e168926f3924a#1585327430; WC_USERACTIVITY_470209609=470209609%2C10301%2C0%2Cnull%2C1585324720263%2C1585329417623%2Cnull%2Cnull%2Cnull%2Cnull%2CcHGyWdq3IZi1DcjWHA8fPk3BpAipgUsQWYb%2FaUxEnqaAiDVrqHCtmZUFUtMQNma1XLQB3YW9Uql1VSNlK6S7jru%2BYjn3XkE026jrFhA7blY03iWOEwDCPtT8oT805QYk0XShWPLgfytFcUD6o%2BmH7NNyhVLFOvvV5Tr1KW%2F%2BRnsHlko67aRfDpr%2BTfwydksKOWUrU%2B8Xg6DbpTOfvQh7So21Akz7CEV4nH0uxifKrlA%3D; bm_sv=FB4CDAA813919E8DB627983E798C0C8A~lGGxESYMVsPY4ZnGqs2nmjtf3YiZkFVFKOjYhxMVLgBac2VyzTx6pp1+Dz/ztDogzxmKMkETVUo/eaZMwDfkHQmnxYQB31YQmvF9VyCzq8noo7gUI7HpIQbNdq/LmmQ+63ruB0Kp3g+XSD3yAhEeQUSb5oD8+rF9qTFncYk0Qfk=' --compressed"

loop do
  stdout, = Open3.capture3(cmd)
  response = JSON.parse(stdout.strip)
  puts response
  if response['invAvailable']
    send_email
    break
  end
  puts 'Nope'
  sleep 10
end
