window.onload = function() {
	var avatar = document.getElementById("avatar");
	var svgDoc = avatar.contentDocument;
	var head = svgDoc.getElementById("head");
	console.log(svgDoc);
	console.log(head.getBoundingClientRect());
	app.ports.recieveHotspotCoords.send(head.getBoundingClientRect());
};
