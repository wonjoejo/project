let file = document.querySelector("#profile-photo");

file.addEventListener("change", function (f) {
  let reader = new FileReader();
  let input = f.target;

  reader.onload = function (e) {
    let dataUrl = reader.result;
    const photo = document.getElementById("profile-upload");

    photo.style.backgroundImage = "url(" + dataUrl + ")";
  };

  reader.readAsDataURL(file.files[0]);
});