const d3 = require('d3');

// make an async fetch call to the server for the raw data and await the promise resolution to assign it to reference 'data' for formatting later.
async function fetchData() {
  // Fetch data from endpoint
  const response = await fetch("/charts/chart-data");
  const data = await response.json();
  return data;
};

const data = await fetchData();

// Set chart dimensions and scales
let margin = { top: 20, right: 20, bottom: 30, left: 50 },
  width = 960 - margin.left - margin.right,
  height = 500 - margin.top - margin.bottom;

let x = d3.scaleTime().range([0, width]);
let y = d3.scaleLinear().range([height, 0]);

// Define target range lines
let targetRange = [
  { y: d3.scaleLinear().range([height, 0]).domain([3, 15]), color: 'green' },
  { y: d3.scaleLinear().range([height, 0]).domain([5, 15]), color: 'yellow' },
  { y: d3.scaleLinear().range([height, 0]).domain([8, 15]), color: 'red' },
];

// Create the chart
let chart = d3.select("#chart").append("svg")
  .attr("width", width + margin.left + margin.right)
  .attr("height", height + margin.top + margin.bottom)
  .append("g")
  .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

// Format the data
data.forEach(function (d) {
  d.Device_Timestamp = new Date(d.Device_Timestamp);
  d.BG = +d.BG;
});

// Set the x and y domains
x.domain(d3.extent(data, function (d) { return d.Device_Timestamp; }));
y.domain(d3.extent(data, function (d) { return d.BG; }));

// Add the x-axis
chart.append("g")
  .attr("class", "x axis")
  .attr("transform", "translate(0," + height + ")")
  .call(d3.axisBottom(x));

// Add the y-axis
chart.append("g")
  .attr("class", "y axis")
  .call(d3.axisLeft(y));

// Add the line representing the BG data
let line = d3.line()
  .x(function (d) { return x(d.Device_Timestamp); })
  .y(function (d) { return y(d.BG); });

// Target ranges
let lowRange = [3, 5];
let mediumRange = [5, 8];
let highRange = [8, 15];

// Add the dots for each BG reading
chart.selectAll(".dot")
  .data(data)
  .enter().append("circle")
  .attr("class", "dot")
  .attr("cx", function (d) { return x(d.Device_Timestamp); })
  .attr("cy", function (d) { return y(d.BG); })
  .attr("r", 5)
  .style("fill", function (d) {
    if (d.BG >= lowRange[0] && d.BG < lowRange[1]) {
      return "green";
    } else if (d.BG >= mediumRange[0] && d.BG < mediumRange[1]) {
      return "yellow";
    } else if (d.BG >= highRange[0] && d.BG <= highRange[1]) {
      return "red";
    }
  });

// Add the target range lines
targetRange.forEach(function (d) {
  let rangeLine = d3.line()
    .x(function (d) { return x(d.Device_Timestamp); })
    .y(function (d) { return d.y(d.BG); });

  chart.append("path")
    .datum(data)
    .attr("class", "target-range-line")
    .style("stroke", d.color)
    .attr("d", rangeLine);
});