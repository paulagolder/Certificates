function hide(Eid) {

	var list = document.getElementById(Eid);
	
	if (list.style.visibility == 'hidden') {
		list.style.visibility = '';
		list.style.display = 'block';
	} else {
		list.style.visibility = 'hidden';
		list.style.display = 'none';
	}

}