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
cmd = "curl 'https://www.costco.com/AjaxGetContractPrice?itemId=507802&catalogId=10701&productId=507801&WH=725-bd' -H 'authority: www.costco.com' -H 'accept: application/json, text/javascript, */*; q=0.01' -H 'sec-fetch-dest: empty' -H 'x-requested-with: XMLHttpRequest' -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'referer: https://www.costco.com/kirkland-signature-bath-tissue%2c-2-ply%2c-425-sheets%2c-30-rolls.product.100142093.html' -H 'accept-language: en-US,en;q=0.9' -H $'cookie: spid=629D5B6B-53FC-4322-92AE-98BF7C762AC8; WRUID21112018=2662542638400104; _cs_ex=1; _cs_c=1; invCheckStateCode=CA; _abck=A39235AADD0A92066A7EA8FE3C0A146B~0~YAAQ3Lfvx+mqAmNwAQAA4sYQeQPUGOn9xkRXZdhs9sxoB23TsPgUH9jCjOiEDFzkkG5b62Q8EJMLNSwF9rN6hiVfVMBFWJuWPCFmCPQ9yGqiCwymWEFCTulicgedLfXp0cmpmbd1WIVLAgsWnaeaOdfGGOYa1loHEAwwthlPNN7+ZM/4xzJeFNsO+nTa/J6FIVuHnq3vKNTnv4wsQ9TsVz9M2ylGwhTfgXa4rS202pWVv9B28bHszfA0tcsfuDkxu5rFpiYsHkjaaJ0bEek4+2svpXIR/ujoZ166x5K1ETcK/ZaVNCJ+7f1FyyrkB+fnSu6902PXMA==~-1~-1~-1; invCheckPostalCode=94595; akaas_AS01=2147483647~rv=91~id=6c0cbae1bc8125b64e2e40251310a8d7; check=true; AMCVS_97B21CFE5329614E0A490D45%40AdobeOrg=1; s_cc=true; WAREHOUSEDELIVERY_WHS=National%3D00847%2CRegional%3D725-bd; WC_SESSION_ESTABLISHED=true; WC_ACTIVEPOINTER=-1%2C10301; memberPrimaryPostal=94595; bvUserToken=f8a8fffc1c6a084cfd7c6d89bae2bc26646174653d323032302d30332d3237267573657269643d38656333373864332d623031342d346636312d613539332d36396533386539356533326526656d61696c616464726573733d742e672e77753636313740676d61696c2e636f6d264d656d6265724e756d6265723d313131383839393931303338; rememberedLogonId=%7B%22id%22%3A%22470209609%22%2C%22hash%22%3A%22618c1f9a0838452bbc98ba938467d7d31431f876a25857a99b738db0dd16469ae6a871643d3e2d86f90d76815e3340cc161778d47369bbe88580607d4b3c5ad4%22%7D; checkoutMemberTier=Z00020; rememberedShowMemberItem=1; capp_json=%7B%22coBrandedCreditMax%22%3Afalse%2C%22displayErrorForRenew%22%3Afalse%2C%22displayErrorForCancel%22%3Afalse%2C%22displayErrorForRenewGSHousehold%22%3Afalse%7D; sellpoints_abtesting={}; BVImplnative_review_form=2070_2_0; C_CLIENT_SESSION_ID=1618b642-b53a-451c-b928-4a8afcf9e158; BVBRANDID=aa25be61-9b94-4d88-ac14-f0e67621b253; lastAddedProductId=1849105; s_sq=%5B%5BB%5D%5D; client-zip-short=94595; C_LOC=CA; AKA_A2=A; bm_sz=6933E71A501589F8948965360537304F~YAAQssM9F6Q0RwtxAQAAgksUHwdctkUQp4dkiaZsTig8a5PU1hvSe8POGpFyi6udk9ga6E4gTDrPnXns2jY90BQ6/HcEl27grhtq86qFfX7ni+ec7rkI3HmUMJk0S6kefhrk1utcVVw52r4NViSojbq1FntbWA30bjWiTu8IeK7zBztLm6ZXERg1eMFirLgd; JSESSIONID=0000-fzUV0NQP2vo7RwO5QlJRFg:1cq6ldm56; costco_f_p_LOCATIONS=%7B%22contract%22%3A%7B%22id%22%3A%22%22%2C%22switch%22%3A%22false%22%7D%7D; WC_PERSISTENT=EGLKbfU5I0%2Bp4SbgUoknGhPtqV8%3D%0A%3B2020-03-27+19%3A59%3A17.229_1544819449469-1962_10301_-1002%2C-1%2CUSD%2C0APgOlwtRjGYAeD7WGmYGGgzMizIKOmm65KN%2Bnw%2FRlT5VF90%2FXPjpVYu7h5K9XqPwkQan2LAAnrXW2%2Bct6TXKQ%3D%3D_10301; WC_AUTHENTICATION_-1002=-1002%2C5M9R2fZEDWOZ1d8MBwy40LOFIV0%3D; AMCV_97B21CFE5329614E0A490D45%40AdobeOrg=-330454231%7CMCMID%7C10090593080940494551093760079818609271%7CMCAAMLH-1585969157%7C9%7CMCAAMB-1585969157%7CRKhpRz8krg2tLO6pguXWp5olkAcUniQYPHaMWWgdJ3xzPWQmdj0y%7CMCOPTOUT-1585371557s%7CNONE%7CMCAID%7C2F26C6348515D34D-60000A64613FD366%7CvVersion%7C3.1.2; CriteoSessionUserId=6661fb22bf87420093f51559a1a0d2f1; WC_USERACTIVITY_-1002=-1002%2C10301%2C0%2Cnull%2C-1%2Cnull%2C470209609%2C%2Fwebapp%2Fwcs%2Fstores%2Fservlet%2FAjaxGetChatDetails%3FcatalogId%3D10701%26productId%3D507801%26storeId%3D10301%26langId%3D-1%26krypto%3DI3aGKBkz2x3Qy%252B7MezqMTBuN6Qc5jQJY9MEd7%252BTg%252BEEgJIeLq99rE0MZsJVZpCeRENp7gFuyB%252BNKTJGaGzhwXNprggfyCrYaQdAzjMnQheCoyU3EXIY7mMF7LEA4zY%252B9fJgw%252FUn81VfEGTUPyOaKlS7DZNFWp1WEeGL6tQhD%252F%252BY%253D%2Cnull%2Cnull%2C%2F22dM0%2BEbkN6hJXyvvqLiFaUSRuxeOhIAzrpQR3nioLm4aMbleQb2ynLjZViMYVewS45SVQUqHL8T9FouO39rBITumcZRAiMW3OhtncJKGI3Sp3UBpyy%2Fp8mlMxOfR0D2LrjmFc7q3lSpL%2BCZDCO4NA%2FBD19aIDkTMXXTrQxcpJOGrH2RR9rc5q5R7aIP9r5RCRT4IflfJwvsbbeCljLqoA%2FxHssc%2BbB%2Be%2FTR5LVxCzs6WpURE0fPTF%2BSHyk%2Bdkc%2Fvysy%2FQSYZM%2F6v%2FNcJoIu2YUBAjTqsKLuSTo%2BDi3Duz8P3eBruR1THJIna1z6BY5wBS1ypgERAV9Tp6a2lpMRu3proh6FubLZoPbmiEWb2Jj2C%2Fru%2FC6atPEazxcK0%2F68AGXHXClO%2BKJtT2lEA4gPXgyp3VzdvszbOiWuGtGPY%2BdDP7B5aQkfDVcWQTrynwSb0m2NG28wETd1CagtCy%2FT8Fjp%2FLp8BbgHYSVCnnDq3vzqnKVnsW%2FNWVNcq65lPhD5ofI5VqOX5yym5%2BGE4GQyVqpQ%2Fm0Sh%2F6yb28EL%2FOZ6CcRqDx%2FgblwX8zWQHbPzlwXtW8yG5VzJYDCxHPc94n48SeA2lcrAQ%2BDf%2Fxo9M1dAU%3D; WC_GENERIC_ACTIVITYDATA=[12587132696%3Atrue%3Afalse%3A0%3AEMTMZCDMZwf223B0z4h22u%2FG8cc%3D][com.ibm.commerce.context.entitlement.EntitlementContext|4000000000000001002%253B60523%2660509%253B60519%253B60507%253B60529%253B60517%253B60539%253B60505%253B60527%253B60515%253B60537%253B60503%253B60525%253B60513%253B60535%253B60501%253B60523%253B4000000000000001002%253B60511%253B60533%253B60521%26null%26-2000%26null%26null%26null][com.ibm.commerce.context.audit.AuditContext|1544819449469-1962][com.ibm.commerce.context.globalization.GlobalizationContext|-1%26USD%26-1%26USD][com.ibm.commerce.store.facade.server.context.StoreGeoCodeContext|null%26null%26null%26null%26null%26null][com.ibm.commerce.catalog.businesscontext.CatalogContext|10701%26null%26false%26false%26false][com.ibm.commerce.context.experiment.ExperimentContext|null][com.ibm.commerce.context.ExternalCartContext|null][CTXSETNAME|Store][com.ibm.commerce.context.base.BaseContext|10301%26-1002%26-1002%26-1][com.ibm.commerce.giftcenter.context.GiftCenterContext|null%26null%26null]; ak_bmsc=125ABFC9F29AC956FFE1558709CB4CBE173DC3B2444F000083BD7E5ECD292B70~pldCCUL7jLULQXr6iMAL416nGOHWjuCOs6FlNZ2/F1gSg6L1f+RZnHyqrJlr5ZPJCpQ/QeIKJ4+a3nK0z40R1o75vD29TQ4WI+WK2nR0oPYAkpT7FFi9eFkB58PvmYYzFn8dQbN0VB/uaNMGRzYs1xX0TNNtzxJmcrv56B8l+dZoqTEmcqYAjOJY1p9PxKvD5Zp4ds4HsLr3WAPBGkVZZL5Ve8Fjx3B3ySdRCt8kOhJf2B8BT2rUNrCuxDMU5rZtIM; sto__session=1585364357618; sto__count=0; __CT_Data=gpv=34&ckp=tld&dm=costco.com&apv_59_www33=34&cpv_59_www33=34&rpv_59_www33=32; sp_ssid=1585364357859; BVBRANDSID=d13f00c9-f4f8-41c2-89e3-fa66ecf5c964; ctm={\'pgv\':2421509817741066|\'vst\':3056794490810994|\'vstr\':4395669631139363|\'intr\':1585364362123|\'v\':1|\'lvst\':622}; RT=\"z=1&dm=www.costco.com&si=32b01fa5-30ad-4c92-b106-57c6fcfcbf00&ss=k8b105wp&sl=1&tt=1qr&rl=1\"; mbox=PC#ae9b80ff58dc4362a59e0b1570ef1920.28_0#1645823906|session#061ec921264046bcb6bc59426f0a45f0#1585366223; bm_sv=8641E935FF668C8AB5112FCB021CE0C7~oHaqKFah7SQe35cBRYXpqEqCnW8U270J4FQjJxAL/yzp75KplUK8x7FXZjg2bJYbed9+b3Xovf6OJLaxh3kHMnejmIDfe5xHOYX4lCC86QooJioTzhnfSBdCBcaOKdvrme60RPLNKbEIqjoF4DHMRPH/LQNl4THyrQK9oOUaki0=' --compressed"

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
