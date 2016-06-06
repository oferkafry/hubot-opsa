// Generated by CoffeeScript 1.10.0
(function () {
    var fs, path,
        indexOf = [].indexOf || function (item) {
                for (var i = 0, l = this.length; i < l; i++) {
                    if (i in this && this[i] === item) return i;
                }
                return -1;
            };
    fs = require('fs');
    path = require('path');
    require('coffee-script/register');
    require('./node_modules/hubot/bin/hubot.js');
    module.exports = function (robot, scripts) {
        var i, len, ref, results, script, scriptsPath;
        scriptsPath = path.resolve(__dirname, 'src');
        if (fs.existsSync(scriptsPath)) {
            ref = fs.readdirSync(scriptsPath).sort();
            results = [];
            for (i = 0, len = ref.length; i < len; i++) {
                script = ref[i];
                if ((scripts != null) && indexOf.call(scripts, '*') < 0) {
                    if (indexOf.call(scripts, script) >= 0) {
                        results.push(robot.loadFile(scriptsPath, script));
                    } else {
                        results.push(void 0);
                    }
                } else {
                    results.push(robot.loadFile(scriptsPath, script));
                }
            }
            return results;
        }
    };
}).call(this);
//# sourceMappingURL=index.js.map
