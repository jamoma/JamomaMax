function savePresetFile() {
var parent;
parent = this.patcher.parentpatcher;
 parent.applyif(function(obj) {
obj.message("preset:new", 1, "default");
obj.message("preset:write");
 }, function(obj) {
return obj.maxclass == "j.model"
})
}

function generateDocumentation() {
var parent;
parent = this.patcher.parentpatcher;
 parent.applyif(function(obj) {
obj.message("model:reference/generate");
 }, function(obj) {
return obj.maxclass == "j.model"
})
}