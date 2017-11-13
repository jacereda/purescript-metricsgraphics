"use strict";

var MG = require('metrics-graphics');
exports.defaultOptionsImpl = null;
MG.add_hook('global.defaults', function(d) {
  var o = {};
  for (var k in d)
    o[k] = d[k];
  o.title = 'title';
  o.description = 'description';
  o.legend = [];
  o.missing_text = 'missing';
  o.show_missing_background = false;
  o.x_scale_type = 'linear';
  o.target = '#viz';
  o.markers = [];
  o.baselines = [];  
  exports.defaultOptionsImpl = o;
});
try {
  MG.data_graphic({target:"#defaultOptions", data:[[{'date':0, 'value':0}]]});
}
catch (e) {
}
