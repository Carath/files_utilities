window.Charts = function() {

	function buildChart(chart) {
		if(chart.type == "pieChart") {
			var elem = $('#'+chart.id);
			buildPieChart(elem,chart);
		} else if(chart.type == "bigpieChart") {
			var elem = $('#'+chart.id);
			buildBigPieChart(elem,chart);
		} else if(chart.type == "h2barChart") {
			var elem = $('#'+chart.id);
			buildHorizDblBarChart(elem,chart);
		} else if(chart.type == "h2classicbarChart") {
			var elem = $('#'+chart.id);
			buildHorizClassicDblBarChart(elem,chart);
		} else if(chart.type == "v2barChart") {
			var elem = $('#'+chart.id);
			buildDblBarChart(elem,chart);
		} else if(chart.type == "stackedLinesChart") {
			var elem = $('#'+chart.id);
			buildStackedLinesChart(elem,chart);
		} else if(chart.type == "lineChart") {
			var elem = $('#'+chart.id);
			buildSingleLineChart(elem,chart);
		}
		
	}
	
	function buildPieChart(elem,chart) {
		elem.dxPieChart({
			dataSource: chart.data,
			series: {
				argumentField: chart.fields[0],
				valueField: chart.fields[1],
				label: {
					visible: true,
					connector: {
						visible: true
					}
				}
			},
			tooltip: {
				enabled: true,
				precision: 2,
				customizeText: function (value) {
					return value.percentText;
				}
			},
			title: {
				text: chart.title
			},
			legend: {
				horizontalAlignment: "center",
				verticalAlignment: "bottom"
			}
		});
	}
	
	function buildBigPieChart(elem,chart) {
		elem.dxPieChart({
			dataSource: chart.data,
			series: {
				argumentField: chart.fields[0],
				valueField: chart.fields[1],
				label: {
					visible: true,
					connector: {
						visible: true
					}
				}
			},
			tooltip: {
				enabled: true,
				precision: 2,
				customizeText: function (value) {
					return value.percentText+" - "+value.argumentText;
				}
			},
			title: {
				text: chart.title,
			}
		});
	}
	
	function buildHorizDblBarChart(elem,chart) {
		elem.dxChart({
			dataSource: chart.data,
			rotated: true,
			pointSelectionMode: "multiple",
			series: [
				{
					valueField: chart.fields[1],
					name: chart.legend[0],
					color: "#ee5511"
				},
				{
					valueField: chart.fields[2],
					name: chart.legend[1],
					color: "#aaaa11"
				}
			],
			commonSeriesSettings: {
				argumentField: chart.fields[0],
				type: "stackedbar",
				selectionStyle: {
				    hatching: "left"
				},
				label: {
					visible: true,
					connector: {
						visible: true
					}
				}
			},
			tooltip: {
				enabled: true
			},
			title: {
				text: chart.title
			},
		});
	}
	
	function buildHorizClassicDblBarChart(elem,chart) {
		elem.dxChart({
			dataSource: chart.data,
			rotated: true,
			series: [
				{
					valueField: chart.fields[1],
					name: chart.legend[0],
					color: "#ee5511"
				},
				{
					valueField: chart.fields[2],
					name: chart.legend[1],
					color: "#aaaa11"
				}
			],
			commonSeriesSettings: {
				argumentField: chart.fields[0],
				type: "bar",
				selectionStyle: {
				    hatching: "left"
				},
				label: {
					visible: true,
					connector: {
						visible: true
					}
				}
			},
			tooltip: {
				enabled: true
			},
			title: {
				text: chart.title
			},
		});
	}
	
	function buildDblBarChart(elem,chart) {
		elem.dxChart({
			dataSource: chart.data,
			series: [
				{
					valueField: chart.fields[1],
					name: chart.legend[0],
					color: "#ee5511"
				},
				{
					valueField: chart.fields[2],
					name: chart.legend[1],
					color: "#aaaa11"
				}
			],
			commonSeriesSettings: {
				argumentField: chart.fields[0],
				type: "bar",
				hoverMode: "allArgumentPoints",
				selectionMode: "allArgumentPoints",
				label: {
					visible: true,
					connector: {
						visible: true
					},
					format: "fixedPoint",
            		precision: 0
				}
			},
			tooltip: {
				enabled: true
			},
			title: {
				text: chart.title
			},
			legend: {
				verticalAlignment: "bottom",
				horizontalAlignment: "center"
			},
		});
	}
	
	function buildStackedLinesChart(elem,chart) {
		elem.dxChart({
			dataSource: chart.data,
			commonSeriesSettings: {
				type: "spline",
				argumentField: chart.fields[0]
			},
			commonAxisSettings: {
				grid: {
				    visible: true
				}
			},
			series: [
				{ valueField: chart.fields[1], name: chart.legend[0] },
				{ valueField: chart.fields[2], name: chart.legend[1] }
			],
			tooltip:{
				enabled: true,
				customizeTooltip: function (value) {
	                return {text: value.argumentText+" - "+value.valueText};
	            }
			},
			legend: {
				verticalAlignment: "bottom",
				horizontalAlignment: "center"
			},
			title: chart.title,
			commonPaneSettings: {
				border:{
				    visible: true,
				    bottom: false
				}
			}
		});
	}
	
	function buildSingleLineChart(elem,chart) {
		elem.dxChart({
			dataSource: chart.data,
			commonSeriesSettings: {
				type: "spline",
				argumentField: chart.fields[0]
			},
			commonAxisSettings: {
				grid: {
				    visible: true
				}
			},
			series: [
				{ valueField: chart.fields[1], name: chart.legend[0] }
			],
			tooltip:{
				enabled: true,
				customizeTooltip: function (value) {
	                return {text: value.argumentText+" - "+value.valueText};
	            }
			},
			legend: {
				verticalAlignment: "bottom",
				horizontalAlignment: "center"
			},
			title: chart.title,
			commonPaneSettings: {
				border:{
				    visible: true,
				    bottom: false
				}
			}
		});
	}

	return {
		load : function(source,data) {
			$.post(source,data)
				.done(function(res) {
				if(res && res.charts) {
					for(var i in res.charts) {
						buildChart(res.charts[i]);
					}
				}
			});
		}
	};
};
