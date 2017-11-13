var d3 = require('d3');


exports.curveCatmullRomAlpha0 = d3.curveCatmullRom.alpha(0);
exports.curveLinearClosed = d3.curveLinearClosed;
exports.curveStep = d3.curveStep;
exports.curveStepBefore = d3.curveStepBefore;
exports.curveStepAfter = d3.curveStepAfter;
exports.curveBasis = d3.curveBasis;
exports.curveBasisOpen = d3.curveBasisOpen;
exports.curveBasisClosed = d3.curveBasisClosed;
exports.curveBundle = d3.curveBundle;
exports.curveCardinal = d3.curveCardinal;
exports.curveCardinalOpen = d3.curveCardinalOpen;
exports.curveCardinalClosed = d3.curveCardinalClosed;
exports.curveMonotoneX = d3.curveMonotoneX;
exports.curveCatmullRomClosed = d3.curveCatmullRomClosed;
exports.curveCatmullRomOpen = d3.curveCatmullRomOpen;
exports.curveEq = function(a) {
  return function(b) {
    return a.name == b.name;
  };
};
