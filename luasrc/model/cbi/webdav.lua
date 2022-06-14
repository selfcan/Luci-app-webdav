-- Licensed to the public under the Apache License 2.0.

m = Map("webdav")
m.title	= translate("Webdav")
m.description = translate("Simple Webdav  Project Address https://github.com/hacdias/webdav.")

m:section(SimpleSection).template  = "webdav/webdav_status"

s = m:section(TypedSection, "webdav")
s.addremove = false
s.anonymous = true

o = s:option(Flag, "enabled", translate("Enable"))
o.rmempty = false

o = s.option(form.TextValue, '_tmpl', null, _("This is the content of the file '/etc/webdav/webdav.yaml' from which your webdav configuration will be generated."));
o.rows = 20;
o.cfgvalue = function(section_id) {
			return fs.trimmed('/etc/webdav/webdav.yaml');
		};
o.write = function(section_id, formvalue) {
			return fs.write('/etc/webdav/webdav.yaml', formvalue.trim().replace(/\r\n/g, '\n') + '\n');
		};

return m
