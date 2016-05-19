# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

createMessage = (res) ->
  numHosts = res.match[1]
  opsa = JSON.stringify `{
      "oa_sysperf_global"
  :
      [
          {
              "processedResult": [
                  {
                      "resultType": "singlevalue",
                      "metricName": "AGGREGATE_AVG_oa_sysperf_global_cpu_util",
                      "metricLabel": "CPU Util &#x28;Aggregate avg&#x29;",
                      "metricUnit": "%",
                      "metricDescription": "CPU Util &#x28;Aggregate avg&#x29;",
                      "dimensionValues": [
                          "16.60.188.71"
                      ],
                      "displayDimensionValues": [
                          "16.60.188.71"
                      ],
                      "drillLabel": "host withkey \"16.60.188.71\"",
                      "drillPQL": "host withkey \"16.60.188.71\"",
                      "drillTimeFrame": null,
                      "metricValues": [
                          {
                              "metricValue": 41.6077777777778,
                              "computeType": "topn_aggregate_avg"
                          }
                      ]
                  },
                  {
                      "resultType": "singlevalue",
                      "metricName": "TOPN_AGGREGATE_AVG_oa_sysperf_global_cpu_util_10",
                      "metricLabel": "CPU Util &#x28;Aggregate avg&#x29; &#x28;Topn&#x29;",
                      "metricUnit": "",
                      "metricDescription": "CPU Util &#x28;Aggregate avg&#x29; &#x28;Topn&#x29;",
                      "dimensionValues": [
                          "16.60.188.71"
                      ],
                      "displayDimensionValues": [
                          "16.60.188.71"
                      ],
                      "drillLabel": "host withkey \"16.60.188.71\"",
                      "drillPQL": "host withkey \"16.60.188.71\"",
                      "drillTimeFrame": null,
                      "metricValues": [
                          {
                              "metricValue": 1.0,
                              "computeType": "topn_aggregate_avg_rank"
                          }
                      ]
                  },
                  {
                      "resultType": "singlevalue",
                      "metricName": "AGGREGATE_AVG_oa_sysperf_global_cpu_util",
                      "metricLabel": "CPU Util &#x28;Aggregate avg&#x29;",
                      "metricUnit": "%",
                      "metricDescription": "CPU Util &#x28;Aggregate avg&#x29;",
                      "dimensionValues": [
                          "opsa-aob2.hpswlabs.adapps.hp.com"
                      ],
                      "displayDimensionValues": [
                          "opsa-aob2.hpswlabs.adapps.hp.com"
                      ],
                      "drillLabel": "host withkey \"opsa-aob2.hpswlabs.adapps.hp.com\"",
                      "drillPQL": "host withkey \"opsa-aob2.hpswlabs.adapps.hp.com\"",
                      "drillTimeFrame": null,
                      "metricValues": [
                          {
                              "metricValue": 3.06888888888889,
                              "computeType": "topn_aggregate_avg"
                          }
                      ]
                  },
                  {
                      "resultType": "singlevalue",
                      "metricName": "TOPN_AGGREGATE_AVG_oa_sysperf_global_cpu_util_10",
                      "metricLabel": "CPU Util &#x28;Aggregate avg&#x29; &#x28;Topn&#x29;",
                      "metricUnit": "",
                      "metricDescription": "CPU Util &#x28;Aggregate avg&#x29; &#x28;Topn&#x29;",
                      "dimensionValues": [
                          "opsa-aob2.hpswlabs.adapps.hp.com"
                      ],
                      "displayDimensionValues": [
                          "opsa-aob2.hpswlabs.adapps.hp.com"
                      ],
                      "drillLabel": "host withkey \"opsa-aob2.hpswlabs.adapps.hp.com\"",
                      "drillPQL": "host withkey \"opsa-aob2.hpswlabs.adapps.hp.com\"",
                      "drillTimeFrame": null,
                      "metricValues": [
                          {
                              "metricValue": 2.0,
                              "computeType": "topn_aggregate_avg_rank"
                          }
                      ]
                  }
              ],
              "filterQueryResult": false,
              "metricLabels": [
                  "CPU Util &#x28;Aggregate avg&#x29; &#x28;Topn&#x29;",
                  "CPU Util &#x28;Aggregate avg&#x29; &#x28;&#x25;&#x29;"
              ],
              "outerCall": false,
              "partialResult": false,
              "aggregatePlayback": false,
              "metaResult": false
          }
      ]
  }
  `
  msgData = {
    text: "Latest changes"
    attachments: [
      {
        fallback: "Comparing 77777",
        title: "Comparing 88988888}"
        title_link: "89988898"
        text: "commits_summary"
        mrkdwn_in: ["text"]
      }
    ]
  }
  res.robot.emit 'slack.attachment',
    message: {
      "type": "message",
      "channel": "C2147483705",
      "user": "ofer",
      "text": "Hello world",
      "ts": "1355517523.000005"
      "envelope": "envelope"

    }
    content:
# see https://api.slack.com/docs/attachments
      text: "Alert Test"
      fallback: "Alert fallback"
      fields: [{
        title: "Alert Field 1"
        value: "Alert value 1"
      }]
    channel: "#opsa-channel" # optional, defaults to message.room
    username: "opsa" # optional, defaults to robot.name
    icon_url: "..." # optional
    icon_emoji: "..." # optional
#    res.robot.adapter.customMessage msgData
#    res.reply "Displaying top #{numHosts} hosts"+ opsa
scan = (obj, level) ->
  k = undefined
  if typeof level == 'undefined'
    level = 0
  spaces = ''
  c = 0
  while c < level
    spaces += ' '
    c++
  if obj instanceof Object
    fields = ''
    lineNum = 1
    for k of obj
      `k = k`
      if obj.hasOwnProperty(k)
#recursive call to scan property\
        fields += spaces + '*' + k + ':*' + scan(obj[k], level + 1) + "\n"
  else
#not an Object so obj[k] here is a value
    return spaces + "`" + obj + '`\n'
  fields + '\n'

# ---
# generated by js2coffee 2.2.0

# ---
# generated by js2coffee 2.2.0

# ---
# generated by js2coffee 2.2.0
# ---
# generated by js2coffee 2.2.0
# ---
# generated by js2coffee 2.2.0
displayHosts = (res) ->
  numHosts = res.match[1]
  opsa = JSON.stringify `{
      "oa_sysperf_global"
  :
      [
          {
              "processedResult": [
                  {
                      "resultType": "singlevalue",
                      "metricName": "AGGREGATE_AVG_oa_sysperf_global_cpu_util",
                      "metricLabel": "CPU Util &#x28;Aggregate avg&#x29;",
                      "metricUnit": "%",
                      "metricDescription": "CPU Util &#x28;Aggregate avg&#x29;",
                      "dimensionValues": [
                          "16.60.188.71"
                      ],
                      "displayDimensionValues": [
                          "16.60.188.71"
                      ],
                      "drillLabel": "host withkey \"16.60.188.71\"",
                      "drillPQL": "host withkey \"16.60.188.71\"",
                      "drillTimeFrame": null,
                      "metricValues": [
                          {
                              "metricValue": 41.6077777777778,
                              "computeType": "topn_aggregate_avg"
                          }
                      ]
                  },
                  {
                      "resultType": "singlevalue",
                      "metricName": "TOPN_AGGREGATE_AVG_oa_sysperf_global_cpu_util_10",
                      "metricLabel": "CPU Util &#x28;Aggregate avg&#x29; &#x28;Topn&#x29;",
                      "metricUnit": "",
                      "metricDescription": "CPU Util &#x28;Aggregate avg&#x29; &#x28;Topn&#x29;",
                      "dimensionValues": [
                          "16.60.188.71"
                      ],
                      "displayDimensionValues": [
                          "16.60.188.71"
                      ],
                      "drillLabel": "host withkey \"16.60.188.71\"",
                      "drillPQL": "host withkey \"16.60.188.71\"",
                      "drillTimeFrame": null,
                      "metricValues": [
                          {
                              "metricValue": 1.0,
                              "computeType": "topn_aggregate_avg_rank"
                          }
                      ]
                  },
                  {
                      "resultType": "singlevalue",
                      "metricName": "AGGREGATE_AVG_oa_sysperf_global_cpu_util",
                      "metricLabel": "CPU Util &#x28;Aggregate avg&#x29;",
                      "metricUnit": "%",
                      "metricDescription": "CPU Util &#x28;Aggregate avg&#x29;",
                      "dimensionValues": [
                          "opsa-aob2.hpswlabs.adapps.hp.com"
                      ],
                      "displayDimensionValues": [
                          "opsa-aob2.hpswlabs.adapps.hp.com"
                      ],
                      "drillLabel": "host withkey \"opsa-aob2.hpswlabs.adapps.hp.com\"",
                      "drillPQL": "host withkey \"opsa-aob2.hpswlabs.adapps.hp.com\"",
                      "drillTimeFrame": null,
                      "metricValues": [
                          {
                              "metricValue": 3.06888888888889,
                              "computeType": "topn_aggregate_avg"
                          }
                      ]
                  },
                  {
                      "resultType": "singlevalue",
                      "metricName": "TOPN_AGGREGATE_AVG_oa_sysperf_global_cpu_util_10",
                      "metricLabel": "CPU Util &#x28;Aggregate avg&#x29; &#x28;Topn&#x29;",
                      "metricUnit": "",
                      "metricDescription": "CPU Util &#x28;Aggregate avg&#x29; &#x28;Topn&#x29;",
                      "dimensionValues": [
                          "opsa-aob2.hpswlabs.adapps.hp.com"
                      ],
                      "displayDimensionValues": [
                          "opsa-aob2.hpswlabs.adapps.hp.com"
                      ],
                      "drillLabel": "host withkey \"opsa-aob2.hpswlabs.adapps.hp.com\"",
                      "drillPQL": "host withkey \"opsa-aob2.hpswlabs.adapps.hp.com\"",
                      "drillTimeFrame": null,
                      "metricValues": [
                          {
                              "metricValue": 2.0,
                              "computeType": "topn_aggregate_avg_rank"
                          }
                      ]
                  }
              ],
              "filterQueryResult": false,
              "metricLabels": [
                  "CPU Util &#x28;*Aggregate* avg&#x29; &#x28;Topn&#x29;",
                  "CPU Util &#x28;*Aggregate* avg&#x29; &#x28;&#x25;&#x29;"
              ],
              "outerCall": false,
              "partialResult": false,
              "aggregatePlayback": false,
              "metaResult": false
          }
      ]
  }
  `
  res.reply "Displaying top #{numHosts} hosts" + scan(JSON.parse(opsa))
#Promise = require('promise')
request = require('request')
require('request-debug')(request);
hostName = '16.60.188.235:8080/opsa'
user = "opsa"
password = "opsa"
semaphore = 0
ongoing = false

getSessionId = (res, cookieIndex) ->
  cookie = res.headers["set-cookie"]
  if typeof cookie == 'undefined'
    return
  firstCookie = cookie[cookieIndex]
  jSessionId = firstCookie.split("=")[1].split(";")[0]

createJar = (res, url, cookieIndex) ->
  if !cookieIndex
    cookieIndex = 0
  jSessionId = getSessionId(res, cookieIndex)
  if typeof jSessionId == 'undefined'
    return
  jar = request.jar()
  cookie = request.cookie('JSESSIONID=' + jSessionId)
  console.log "setting cookie: " + cookie
  jar.setCookie cookie, url, (error, cookie) ->
  return jar


updateSemaphore = ->
  ongoing1 = false
  if Date.now() - semaphore < 250000
    ongoing1 = true
  semaphore = Date.now()
  return ongoing1

getSecurityRequestParams = (opsaHomeUrl, res) ->
  url = opsaHomeUrl + "/j_security_check"
  jar = createJar(res, url, 1)
  method = 'POST'
  form =
    j_username: user
    j_password: password
  headers =
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
    'Accept-Encoding': 'gzip, deflate'
    'Accept-Language': 'en-US,en;q=0.8,he;q=0.6'
    'Connection': 'keep-alive'
    'Content-Type': 'application/x-www-form-urlencoded'
    'Upgrade-Insecure-Requests': '1'
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36'
    'Cache-Control': 'max-age=0'
  {
    method
    url
    jar
    headers
    form
  }

getInitialRequestParams = (opsaHomeUrl) ->
  url = opsaHomeUrl
  method = 'GET'
  headers =
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
    'Accept-Encoding': 'gzip, deflate, sdch'
    'Accept-Language': 'en-US,en;q=0.8,he;q=0.6'
    'Connection': 'keep-alive'
    'Upgrade-Insecure-Requests': '1'
    'Content-Type': 'text/html'
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36'
  {
    method
    url
    headers
  }

getNewSessionIdRequestParams = (opsaHomeUrl, res) ->
  url = opsaHomeUrl
  jar = createJar(res, url)
  method = 'GET'
  headers =
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
    'Accept-Encoding': 'gzip, deflate, sdch'
    'Accept-Language': 'en-US,en;q=0.8,he;q=0.6'
    'Connection': 'keep-alive'
    'Upgrade-Insecure-Requests': '1'
    'Cache-Control': 'max-age=0'
  {
    method
    url
    jar
    headers
  }

getAnomaliesRequestParams = (opsaHomeUrl, res, xsrfToken) ->
  url = opsaHomeUrl + '/rest/lmt/getIntegratedSystemsDefaults'

  url = opsaHomeUrl + "/rest/getQueryResult?aqlQuery=%5Banomalies%5BattributeQuery(%7Bopsa_collection_anomalies%7D,+%7B%7D,+%7Bi.anomaly_id%7D)%5D()%5D+&endTime=1463654996351&granularity=0&pageIndex=1&paramsMap=%7B%22$drill_dest%22:%22AnomalyInstance%22,%22$drill_label%22:%22opsa_collection_anomalies_description%22,%22$drill_value%22:%22opsa_collection_anomalies_anomaly_id%22,%22$limit%22:%22500%22,%22$interval%22:300,%22$offset%22:0,%22$N%22:5,%22$pctile%22:10,%22$timeoffset%22:0,%22$starttimeoffset%22:0,%22$endtimeoffset%22:0,%22$timeout%22:0,%22$drill_type%22:%22%22,%22$problemtime%22:1463653196351,%22$aggregate_playback_flag%22:null%7D&queryType=generic&startTime=1463651396351&timeZoneOffset=-180&timeout=10&visualType=table"
  jar = createJar(res, url)
  method = 'GET'
  method = 'POST'
  headers =
    'Accept': 'application/json, text/plain, */*'
    'Accept-Encoding': 'gzip, deflate, sdch'
    'Accept-Language': 'en-US,en;q=0.8,he;q=0.6'
    'Connection': 'keep-alive'
    'Upgrade-Insecure-Requests': '1'
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36'
    'XSRFToken': xsrfToken
  {
    method
    url
    jar
    headers
  }

getXSRFRequestParams = (opsaHomeUrl, res) ->
  method = 'GET'
  url = opsaHomeUrl + "/rest/getXSRFToken"
  headers =
    'Accept': 'application/json, text/plain, */*'
    'Accept-Encoding': 'gzip, deflate, sdch'
    'Accept-Language': 'en-US,en;q=0.8,he;q=0.6'
    'Connection': 'keep-alive'
    'Upgrade-Insecure-Requests': '1'
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36'
    'Cache-Control': 'max-age=0'
  jar = createJar(res, url)
  {
    method
    url
    jar
    headers
  }
invokeOpsaApiHandler = (res1) ->
#  if updateSemaphore()
#    return
## || !updateSemaphore()
  if ongoing
    return
  ongoing = true
  opsaHomeUrl = 'http://' + hostName
  reply = ""
  initUrl = getInitialRequestParams(opsaHomeUrl)
  requestp(initUrl.url, initUrl.headers).then ((res) ->
    secReq = getSecurityRequestParams(opsaHomeUrl, res)
    requestp(secReq.url, secReq.headers, secReq.method, secReq.jar, secReq.form).then ((res) ->
      newIdReq = getNewSessionIdRequestParams(opsaHomeUrl, res)
      requestp(newIdReq.url, newIdReq.headers, newIdReq.method, secReq.jar).then ((apiSessionResponse) ->
        xsrfReq = getXSRFRequestParams(opsaHomeUrl, apiSessionResponse)
        requestp(xsrfReq.url, xsrfReq.headers, xsrfReq.method, xsrfReq.jar).then ((res) ->
          xsrfToken = res.body
          console.log apiSessionResponse
          ongoing = false
          OpsaAPI = undefined
          AnomaliesAPI = undefined
          FirstAnomaliesAPI = undefined

          OpsaAPI = (xsrfToken, jSessionId) ->
            @xsrfToken = xsrfToken.slice 1, -1
            @jSessionId = jSessionId
            return

          AnomaliesAPI = (xsrfToken, jSessionId, hostName, from, to) ->
            OpsaAPI.call this, xsrfToken, jSessionId
            @hostName = hostName
            @from = from
            @to = to
            return

          OpsaAPI::invoke = ->
            console.log 'invoking API' + @jSessionId
            @invoker()
            return

          AnomaliesAPI.prototype = Object.create(OpsaAPI.prototype)
          AnomaliesAPI::constructor = AnomaliesAPI

          AnomaliesAPI::invoker = ->
            console.log 'Hello, I\'m ' + @firstName + '. I\'m studying ' + @subject + '.'
            anomReq = getAnomaliesRequestParams(opsaHomeUrl, apiSessionResponse, @xsrfToken)
            requestp(anomReq.url, anomReq.headers, anomReq.method, anomReq.jar).then ((anomResponse) ->
              res1.reply 'Displaying Anomalies For Host: ' + scan(JSON.parse(JSON.stringify(anomResponse.body)))
            )
            return

          AnomaliesAPI::sayGoodBye = ->
            console.log 'Goodbye!'
            return

          FirstAnomaliesAPI = new AnomaliesAPI(xsrfToken, apiSessionResponse, 'hostName', 'from', 'to')
          FirstAnomaliesAPI.invoke()








        )
      )
    )
    return
  ), (err) ->
    ongoing = false
    console.error '%s; %s', err.message, opsaHomeUrl
    console.log '%j', err.res.statusCode
    return
  res1.reply 'Please wait'

requestp = (url, headers, method, jar, form) ->
  headers = headers or {}
  method = method or 'GET'
  jar = jar or {}
  form = form or {}
  new Promise((resolve, reject) ->
    reqData = {
      uri: url
      headers: headers
      method: method
    }
    if jar
      reqData.jar = jar
    if form
      reqData.form = form
    request reqData, (err, res, body) ->
      if err
        return reject(err)
      else if res.statusCode == 200 || res.statusCode == 302 || res.statusCode == 400
        resolve res, body
      else
        ongoing = false
        err = new Error('Unexpected status code: ' + res.statusCode)
        err.res = res
        return reject(err)
      resolve res, body
      return
    return
  )


module.exports = (robot) ->
  robot.respond /top (.*) hosts/i, (res) ->
    displayHosts(res)

  robot.respond /alert (.*)/i, (res) ->
    createMessage(res)

  robot.respond /display anomalies for host: (.*)/i, (res) ->
    invokeOpsaApiHandler(res)

