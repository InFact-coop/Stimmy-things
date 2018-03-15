window.onload = function() {
	var avatar = document.getElementById("avatar");
	console.log("hello i'm before addevent");
	console.log("hello i'm in addevent");

	var svgDoc = avatar.contentDocument;
	var head = svgDoc.getElementById("head");
	console.log(svgDoc);
	console.log(head.getBoundingClientRect());
};
