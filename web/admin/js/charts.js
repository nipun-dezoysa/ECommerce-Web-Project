const options = {
  // set grid lines to improve the readability of the chart, learn more here: https://apexcharts.com/docs/grid/
  grid: {
    show: true,
    strokeDashArray: 4,
    padding: {
      left: 2,
      right: 2,
      top: -26,
    },
  },
  series: [
    {
      name: "Placed Orders",
      data: placedss,
      color: "#1A56DB",
    },
    {
      name: "Returned Orders",
      data: returnedss,
      color: "#C41E3A",
    },
    {
      name: "Delivered Orders",
      data: deliveredss,
      color: "#0BDA51",
    },
  ],
  chart: {
    height: "200",
    maxWidth: "100%",
    type: "area",
    fontFamily: "Inter, sans-serif",
    dropShadow: {
      enabled: false,
    },
    toolbar: {
      show: false,
    },
  },
  tooltip: {
    enabled: true,
    x: {
      show: false,
    },
  },
  legend: {
    show: true,
  },
  fill: {
    type: "gradient",
    gradient: {
      opacityFrom: 0.55,
      opacityTo: 0,
      shade: "#1C64F2",
      gradientToColors: ["#1C64F2"],
    },
  },
  dataLabels: {
    enabled: false,
  },
  stroke: {
    width: 6,
  },
  xaxis: {
    categories: categoriess,
    labels: {
      show: false,
    },
    axisBorder: {
      show: false,
    },
    axisTicks: {
      show: false,
    },
  },
  yaxis: {
    show: false,
    labels: {
      formatter: function (value) {
        return value;
      },
    },
  },
};

if (
  document.getElementById("grid-chart") &&
  typeof ApexCharts !== "undefined"
) {
  const chart = new ApexCharts(document.getElementById("grid-chart"), options);
  chart.render();
}

const getChartOptions = () => {
  return {
    series: ordersNums,
    colors: [
      "#FFC94A",
      "#401F71",
      "#10439F",
      "#007F73",
      "#FF204E",
      "#A0153E",
      "#5D0E41",
    ],
    chart: {
      height: 320,
      width: "100%",
      type: "donut",
    },
    stroke: {
      colors: ["transparent"],
      lineCap: "",
    },
    plotOptions: {
      pie: {
        donut: {
          labels: {
            show: true,
            name: {
              show: true,
              fontFamily: "Inter, sans-serif",
              offsetY: 20,
            },
            total: {
              showAlways: true,
              show: true,
              label: "Total Orders",
              fontFamily: "Inter, sans-serif",
              formatter: function (w) {
                const sum = w.globals.seriesTotals.reduce((a, b) => {
                  return a + b;
                }, 0);
                return Math.round(sum * 100) / 100 + "%";
              },
            },
            value: {
              show: true,
              fontFamily: "Inter, sans-serif",
              offsetY: -20,
              formatter: function (value) {
                return Math.round(value * 100) / 100 + "%";
              },
            },
          },
          size: "80%",
        },
      },
    },
    grid: {
      padding: {
        top: -2,
      },
    },
    labels: [
      "New",
      "Processing",
      "Shipped",
      "Delivered",
      "Canceled",
      "Declined",
      "Returned",
    ],
    dataLabels: {
      enabled: false,
    },
    legend: {
      position: "bottom",
      fontFamily: "Inter, sans-serif",
    },
    yaxis: {
      labels: {
        formatter: function (value) {
          return Math.round(value * 100) / 100 + "%";
        },
      },
    },
    xaxis: {
      labels: {
        formatter: function (value) {
          return Math.round(value * 100) / 100 + "%";
        },
      },
      axisTicks: {
        show: false,
      },
      axisBorder: {
        show: false,
      },
    },
  };
};

if (document.getElementById("pie-chart") && typeof ApexCharts !== "undefined") {
  const chart = new ApexCharts(
    document.getElementById("pie-chart"),
    getChartOptions()
  );
  chart.render();
}
