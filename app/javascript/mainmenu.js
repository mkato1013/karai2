function pullDownSearchForm() {

  const pullDownButton = document.getElementById("back-btn");
  const searchForm = document.getElementById("pull-down");

  pullDownButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "color:red;");
  });

  pullDownButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "color:red;");
  });

  pullDownButton.addEventListener('click', function() {
    if (searchForm.getAttribute("style") == "display:block;"){
      searchForm.removeAttribute("style", "display:block;")
    } else {
      searchForm.setAttribute("style", "display:block;")
    };
  });
};

$(function(){

  $('div').on(click,)


});

window.addEventListener('load' , pullDownSearchForm);