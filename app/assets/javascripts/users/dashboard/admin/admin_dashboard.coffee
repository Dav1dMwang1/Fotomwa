#Photo Order Summary
document.addEventListener 'DOMContentLoaded', ->
  Highcharts.chart('photo_order_summary',
    chart: type: 'column'
    stylemode: true
    title: text: 'Photo Order Summary'
    xAxis: categories: [
      'Monday'
    ]
    yAxis: title: text: 'Photo Order Types'
    series: [
      {
        name: 'Passport'
        data: [ 16 ]
      }
      {
        name: '4x6'
        data: [ 7 ]
      }
      {
        name: '5x6'
        data: [ 6 ]
      }
      {
        name: '6x8'
        data: [ 4 ]
      }
      {
        name: '8x10'
        data: [ 10 ]
      }
      {
        name: '8x12'
        data: [ 8 ]
      }
      {
        name: '11x14'
        data: [ 8 ]
      }
      {
        name: 'Custom'
        data: [ 2 ]
      }
    ])
  return

#Payments Summary
document.addEventListener 'DOMContentLoaded', ->
  Highcharts.chart 'payments_summary',
    chart: type: 'pie'
    title: text: 'Payments Summary'
    plotOptions: series: dataLabels:
      enabled: true
      format: '{point.name}: {point.y:.lf}%'
    tooltip:
      headerFormat: '<span style="font-size:15px">{series.name}</span><br>'
      pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
    series: [ {
        name: 'Payments Type'
        colorByPoint: true
        data: [
          {
            name: 'Mobile Money'
            y: 32.74
            drilldown: 'Mobile Money'
          }
          {
            name: 'Cash'
            y: 44.78
            drilldown: null
          }
          {
            name: 'Bank'
            y: 11.33
            drilldown: 'Bank'
          }
          {
            name: 'Credit'
            y: 11.15
            drilldown: 'Credit'
          }
        ]
    }]
    drilldown: series: [
      {
        name: 'Mobile Money'
        id: 'Mobile Money'
        data: [
          [
            'MPesa'
            67
          ]
          [
            'mVisa'
            18.45
          ]
          [
            'Paypal'
            4
          ]
          [
            'MasterPass'
            10.55
          ]
        ]
      }
      {
        name: 'Bank'
        id: 'Bank'
        data: [
          [
            'Barclays'
            20.7
          ]
          [
            'KCB'
            29
          ]
          [
            'Cooperative'
            23.4
          ]
          [
            'Equity'
            17.3
          ]
          [
            'Standard Chartered'
            9.6
          ]
        ]
      }
      {
        name: 'Credit'
        id: 'Credit'
        data: [
          [
            'Frames'
            77.78
          ]
          [
            'Print Paper'
            8.3
          ]
          [
            'Photocopy Paper'
            8.1
          ]
          [
            'Photo Chemical'
            5.82
          ]
        ]
      }
    ]
  return