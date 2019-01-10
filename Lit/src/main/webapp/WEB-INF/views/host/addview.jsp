<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/icon?family=Material+Icons);
@import url("https://fonts.googleapis.com/css?family=Raleway");

/* body { */
/*   font-family: "Raleway", sans-serif; */
/*   height: 100vh; */
/*   display: flex; */
/*   justify-content: center; */
/*   align-items: center; */
/*   flex-direction: column; */
/*   background-color: #eff5f6; */
/* } */

/* .wrapper { */
/*   display: flex; */
/*   flex-direction: row; */
/*   flex-wrap: wrap; */
/*   align-items: center; */
/*   justify-content: center; */
/* } */

#wrapper{
min-width:978px;
max-width:1200px;
margin:0 auto;
}

h1 {
  font-family: inherit;
  margin: 0 0 .75em 0;
  color: #728c8d;
  text-align: center;
}

.box {
  display: block;
  width: 300px;
  height: 300px;
  margin: 10px;
  background-color: white;
  border-radius: 5px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
  overflow: hidden;
  float:left;
}

.upload-options {
  position: relative;
  height: 75px;
  background-color: cadetblue;
  cursor: pointer;
  overflow: hidden;
  text-align: center;
  transition: background-color ease-in-out 150ms;
}
.upload-options:hover {
  background-color: #7fb1b3;
}
.upload-options input {
  width: 0.1px;
  height: 0.1px;
  opacity: 0;
  overflow: hidden;
  position: absolute;
  z-index: -1;
}
.upload-options label {
  display: flex;
  align-items: center;
  width: 100%;
  height: 100%;
  font-weight: 400;
  text-overflow: ellipsis;
  white-space: nowrap;
  cursor: pointer;
  overflow: hidden;
}
.upload-options label::after {
  content: 'add';
  font-family: 'Material Icons';
  position: absolute;
  font-size: 2.5rem;
  color: #e6e6e6;
  top: calc(50% - 2.5rem);
  left: calc(50% - 1.25rem);
  z-index: 0;
}
.upload-options label span {
  display: inline-block;
  width: 50%;
  height: 100%;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
  vertical-align: middle;
  text-align: center;
}
.upload-options label span:hover i.material-icons {
  color: lightgray;
}

.js--image-preview {
  height: 225px;
  width: 100%;
  position: relative;
  overflow: hidden;
  background-image: url("");
  background-color: white;
  background-position: center center;
  background-repeat: no-repeat;
  background-size: cover;
}
.js--image-preview::after {
  content: "photo_size_select_actual";
  font-family: 'Material Icons';
  position: relative;
  font-size: 4.5em;
  color: #e6e6e6;
  top: calc(50% - 3rem);
  left: calc(50% - 2.25rem);
  z-index: 0;
}
.js--image-preview.js--no-default::after {
  display: none;
}
.js--image-preview:nth-child(2) {
  background-image: url("http://bastianandre.at/giphy.gif");
}

i.material-icons {
  transition: color 100ms ease-in-out;
  font-size: 2.25em;
  line-height: 55px;
  color: white;
  display: block;
}

.drop {
  display: block;
  position: absolute;
  background: rgba(95, 158, 160, 0.2);
  border-radius: 100%;
  -webkit-transform: scale(0);
          transform: scale(0);
}

.animate {
  -webkit-animation: ripple 0.4s linear;
          animation: ripple 0.4s linear;
}

@-webkit-keyframes ripple {
  100% {
    opacity: 0;
    -webkit-transform: scale(2.5);
            transform: scale(2.5);
  }
}

@keyframes ripple {
  100% {
    opacity: 0;
    -webkit-transform: scale(2.5);
            transform: scale(2.5);
  }
}

</style>




</head>


<script type="text/javascript">

function initImageUpload(box) {
	  let uploadField = box.querySelector('.image-upload');

	  uploadField.addEventListener('change', getFile);

	  function getFile(e){
	    let file = e.currentTarget.files[0];
	   
	    checkType(file);
	  }
	  
	  function previewImage(file){
	    let thumb = box.querySelector('.js--image-preview'),
	        reader = new FileReader();

	    reader.onload = function() {
	      thumb.style.backgroundImage = 'url(' + reader.result + ')';
	    }
	    reader.readAsDataURL(file);
	    thumb.className += ' js--no-default';
	  }

	  function checkType(file){
	    let imageType = /image.*/;
	    if (!file.type.match(imageType)) {
	      	alert("이미지 파일만 가능합니다.");
	    } else if (!file){
	    	alert("이미지 파일만 가능합니다.");
	    } else {
	      previewImage(file);
	    }
	  }
	
	}

	/// drop-effect
	function initDropEffect(box){
	  let area, drop, areaWidth, areaHeight, maxDistance, dropWidth, dropHeight, x, y;
	  
	  // get clickable area for drop effect
	  area = box.querySelector('.js--image-preview');
	  area.addEventListener('click', fireRipple);
	  
	  function fireRipple(e){
	    area = e.currentTarget
	    // create drop
	    if(!drop){
	      drop = document.createElement('span');
	      drop.className = 'drop';
	      this.appendChild(drop);
	    }
	    // reset animate class
	    drop.className = 'drop';
	    
	    // calculate dimensions of area (longest side)
	    areaWidth = getComputedStyle(this, null).getPropertyValue("width");
	    areaHeight = getComputedStyle(this, null).getPropertyValue("height");
	    maxDistance = Math.max(parseInt(areaWidth, 10), parseInt(areaHeight, 10));

	    // set drop dimensions to fill area
	    drop.style.width = maxDistance + 'px';
	    drop.style.height = maxDistance + 'px';
	    
	    // calculate dimensions of drop
	    dropWidth = getComputedStyle(this, null).getPropertyValue("width");
	    dropHeight = getComputedStyle(this, null).getPropertyValue("height");
	    
	    // calculate relative coordinates of click
	    // logic: click coordinates relative to page - parent's position relative to page - half of self height/width to make it controllable from the center
	    x = e.pageX - this.offsetLeft - (parseInt(dropWidth, 10)/2);
	    y = e.pageY - this.offsetTop - (parseInt(dropHeight, 10)/2) - 30;
	    
	    // position drop and animate
	    drop.style.top = y + 'px';
	    drop.style.left = x + 'px';
	    drop.className += ' animate';
	    e.stopPropagation();
	    
	  }
	}


	$(document).ready(function(){
		
		$("#submit_button").click(function(){
			var dd = $('.image-upload')[0].files[0];
			if(dd ==null){
				alert("최소 첫번째 사진을 삽입해 주세요");
			}
			("#sendPhoto").submit();
			
		});
		
		
		var boxes = document.querySelectorAll('.box');
	
		for (let i = 0; i < boxes.length; i++) {
			  let box = boxes[i];
			  initDropEffect(box);
			  initImageUpload(box);
				}	
		});
</script>


<body>
<div id="wrapper">
 <form id="sendPhoto" name="fileForm" action="/host/addview" method="post" enctype="multipart/form-data">
 <input type ="hidden" name ="lodge_no" value="<c:out value="${lodge_no }"/>">
 <div>
 
 
  <div class="box">
    <div class="js--image-preview"></div>
    <div class="upload-options">
      <label>
        <input type="file"  name = "file" class="image-upload" accept="image|.jpg,image/.png,image/jpeg" />
      </label>
    </div>
  </div>
   
  <div class="box">
    <div class="js--image-preview"></div>
    <div class="upload-options">
      <label>
        <input type="file"  name = "file" class="image-upload" accept="image|.jpg,image/.png,image/jpeg" />
      </label>
    </div>
  </div>
  
   
  <div class="box">
    <div class="js--image-preview"></div>
    <div class="upload-options">
      <label>
        <input type="file"  name = "file" class="image-upload" accept="image|.jpg,image/.png,image/jpeg" />
      </label>
    </div>
  </div>
  
  
  
  </div>
     <div>
      <div class="box">
       <div class="js--image-preview"></div>
       <div class="upload-options">
         <label>
           <input type="file"  name = "file" class="image-upload" accept="image|.jpg,image/.png,image/jpeg" />
         </label>
       </div>
     </div>
     
      
     <div class="box">
       <div class="js--image-preview"></div>
       <div class="upload-options">
         <label>
           <input type="file"  name = "file" class="image-upload" accept="image|.jpg,image/.png,image/jpeg" />
         </label>
       </div>
     </div>
     
      
  </div>
  

  
	
  </form>
	
	  <div class="box">
         <div>
            <h4>사진을 다 등록하셨으면 확인 버튼을 눌러주세요. 사진이 충분하지 않을시 마지막 사진과 동일한 사진이 자동으로 추가됩니다.</h4>
            <button id="submit_button">확인</button>
         </div>

     </div>
     


   





</div>



</body>
</html>

