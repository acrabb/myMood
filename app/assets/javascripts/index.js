var dataset = [
    {"id": 110, "time": "2013-10-12", "score": 4, "userName": "Alice", "activity": "didn't sleep well"},
    {"id": 115, "time": "2013-10-12", "score": 3, "userName": "Clyde", "activity": "had a fight with my best friend"},
    {"id": 111, "time": "2013-10-12", "score": 5, "userName": "Bob", "activity": "had a fight with my best friend"},
    {"id": 110, "time": "2013-10-13", "score": 10, "userName": "Alice", "activity": "didn't sleep well"},
    {"id": 115, "time": "2013-10-13", "score": 7, "userName": "Clyde", "activity": "had a fight with my best friend"},
    {"id": 111, "time": "2013-10-13", "score": 9, "userName": "Bob", "activity": "had a fight with my best friend"},
    {"id": 110, "time": "2013-10-14", "score": 6, "userName": "Alice", "activity": "didn't sleep well"},
    {"id": 115, "time": "2013-10-14", "score": 10, "userName": "Clyde", "activity": "had a fight with my best friend"},
    {"id": 111, "time": "2013-10-14", "score": 2, "userName": "Bob", "activity": "had a fight with my best friend"},
    {"id": 110, "time": "2013-10-15", "score": 4, "userName": "Alice", "activity": "didn't sleep well"},
    {"id": 115, "time": "2013-10-15", "score": 7, "userName": "Clyde", "activity": "had a fight with my best friend"},
    {"id": 111, "time": "2013-10-15", "score": 8, "userName": "Bob", "activity": "had a fight with my best friend"},
]


var dateFormat = d3.time.format("%Y-%m-%d");

var margin = {top: 20, right: 80, bottom: 30, left: 50},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var nestedData = d3.nest()
    .key(function (d) {
        return d.id;
    })
    .key(function (d) {
        return dateFormat(new Date(d.time));
    })
    .key(function (d) {
        return d.score
    })
    .entries(dataset);

minDate = new Date();
minDate.setDate((new Date(dataset[0].time)).getDate() + 1);
maxDate = new Date();
maxDate.setDate((new Date(dataset[dataset.length - 1].time)).getDate() + 3);

//maxDate.setDate(maxDate.getDate() - 1);

console.log(minDate);
console.log(maxDate);

var x = d3.time.scale()
    .domain([minDate, maxDate])
//    .domain([minDate, d3.time.day.offset(new Date(dataset[dataset.length - 1].time), 1)])
//    .range([margin.right, width - margin.right]);
    .range([0, width]);

//var x = d3.time.scale()

var y = d3.scale.linear().domain([0, 10]).range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .ticks(d3.time.days, 1)
    .tickFormat(dateFormat)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left");

var color = d3.scale.category10();

var svg = d3.select("#lB").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

drawMainGraph();

function drawMainGraph() {

    var line = d3.svg.line()
        .interpolate("linear")
        .x(function (d) {
            return x(dateFormat.parse(d.key))
        })
        .y(function (d) {
            return y(d.values[0].key)
        });

    x.domain(d3.extent(dataset, function (d) {
        return new Date(d.time)
    }));
    y.domain([0, 10]).range([height, 0]);

//    console.log(nestedData);

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(-80," + height + ")")
//        .attr("transform", "translate("- margin.left -",0)")
        .call(xAxis);

    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)
        .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", ".71em")
        .style("text-anchor", "end")
        .text("Score");


    var scoreLine = svg.selectAll(".score")
        .data(nestedData)
        .enter()
        .append("g")
        .attr("class", "score")
        .attr("transform", "translate("+ margin.right +",0)")
        .attr("id", function (d) {
            return "score-" + d.key
        });

    scoreLine.append("path")
        .attr("class", "line")
        .attr("transform", "translate(116,0)")
        .attr("d", function (d) {
            return line(d.values);
        })
        .style("stroke", function (d) {
            return color(d.key);
        });
}