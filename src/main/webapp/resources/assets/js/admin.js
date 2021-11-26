const detailbtn = document.querySelectorAll(".detailbtn");

detailbtn.forEach(function (item) {
  item.addEventListener("click", function (e) {
    e.preventDefault();
	
	let modalprofile = document.querySelector("#modal-profile");
    modalprofile.src=item.parentElement.parentElement.children[0].getAttribute("id");
    
    document.querySelector("#modal-id").value = item.parentElement.parentElement.children[2].getAttribute("id");
	document.querySelector("#modal-name").value = item.parentElement.parentElement.children[3].getAttribute("id");
	document.querySelector("#modal-mail").value = item.parentElement.parentElement.children[4].getAttribute("id");
	document.querySelector("#modal-phone").value = item.parentElement.parentElement.children[5].getAttribute("id");
	
    for (let i = 0; i < 6; i++) {
      console.log(
        item.parentElement.parentElement.children[i].getAttribute("id")
      );
    }
  });
});
