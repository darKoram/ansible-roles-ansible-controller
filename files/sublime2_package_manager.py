# ansible_controller/tfiles/sublime2_package_manager.py

import urllib2,os,hashlib
h = '7183a2d3e96f11eeadd761d777e62404' + 'e330c659d4bb41d3bdf022e94cab3cd0'
pf = 'Package Control.sublime-package'
ipp = sublime.installed_packages_path()
os.makedirs( ipp ) if not os.path.exists(ipp) else None
urllib2.install_opener( urllib2.build_opener( urllib2.ProxyHandler()) )
by = urllib2.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read()
dh = hashlib.sha256(by).hexdigest()
open( os.path.join( ipp, pf), 'wb' ).write(by) if dh == h else None
print('Error validating download (got %s instead of %s), please try manual install' % (dh, h) 
	if dh != h else 'Please restart Sublime Text to finish installation') 