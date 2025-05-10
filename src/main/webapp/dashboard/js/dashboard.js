/* globals Chart:false, feather:false */

(function () {
  'use strict'

  feather.replace()

  // Graphs
  var ctx = document.getElementById('myChart');
  
  var jan = document.getElementById('mes1').value;
  var fev = document.getElementById('mes2').value;
  var mar = document.getElementById('mes3').value;
  var abr = document.getElementById('mes4').value;
  var maio = document.getElementById('mes5').value;
  var jun = document.getElementById('mes6').value;
  var jul = document.getElementById('mes7').value;
  var ago = document.getElementById('mes8').value;
  var set = document.getElementById('mes9').value;
  var out = document.getElementById('mes10').value;
  var nov = document.getElementById('mes11').value;
  var dez = document.getElementById('mes12').value;
  
  // eslint-disable-next-line no-unused-vars
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [
        'Janeiro',
        'Fevereiro',
        'Março',
        'Abril',
        'Maio',
        'Junho',
        'Julho',
        'Agosto',
        'Setembro',
        'Outubro',
        'Novembro',
        'Dezembro'
      ],
      datasets: [{
        data: [
          jan,
          fev,
          mar,
          abr,
          maio,
          jun,
          jul,
          ago,
          set,
          out,
          nov,
          dez
        ],
        lineTension: 0,
        backgroundColor: 'transparent',
        borderColor: '#007bff',
        borderWidth: 4,
        pointBackgroundColor: '#007bff'
      }]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: false
          }
        }]
      },
      legend: {
        display: false
      }
    }
  })
}())