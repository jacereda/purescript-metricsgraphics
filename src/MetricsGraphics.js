"use strict";
var MG = require('metrics-graphics');
MG.add_hook('global.before_init', function(d) {
  var o = {};
  for (var k in d)
    o[k] = d[k];
});
exports.dataGraphicImpl = function(d) {
  var o = {};
  for (var k in d)
    o[k] = d[k];
  o.legend = o.legend.length? o.legend : '';
  o.x_accessor = 'x';
  o.y_accessor = 'y';
  if (o.aggregated_x_mouseover) {
    o.x_mouseover = o.aggregated_x_mouseover;
    o.aggregate_rollover = true;
    o.aggregated_x_mouseover = undefined;
  }
  return function() {
    MG.data_graphic(o);
  };
};
