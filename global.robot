# *** Keywords ***

# token user
#     #pos palmerah
#     # ${json}     Load JSON From File     ${CURDIR}/../SchemaObject/auth/posPalmerah.json
#     ${username}=  Set Variable If  '${base_url}' == '${genesis}'  pos.testing.prod  pos.testing.qa
#     ${password}=  Set Variable If  '${base_url}' == '${genesis}'  Hatihati123  Genesis000
#     ${json}=  Create Dictionary  email=${username}  password=${password}
#     Set Test Variable   ${JSON_SCHEMA}      ${json}
#     ${resp}=    POST    ${base_url}/horde/v1/auth/login    json=${JSON_SCHEMA}
#     ${data}     Convert To String       ${resp.json()}
#     ${jsondata}    Evaluate    ${data}
#     ${posPalmerah}=     Set Variable     ${jsondata['data']['token']}
#     Set Global Variable      ${posPalmerah}
#     log to console  Get pos token