<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive navbar</title>
   <style type="text/css">
     * {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    -webkit-font-smoothing: antialiased;
}
:root {
    --primary: #933ded;
    --dark: #232323;
    --pure: #fff;
    --smoke: whitesmoke;
    --dark-gray: #999;
}


body {
    font-family: 'Lato', sans-serif;
   
    color: var(--pure);
}

.container {
    width: 1152px;
    max-width: 90%;
    margin: 0 auto;
     
}
nav
{
     background: var(--dark);
    
}
.nav-wrapper {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.brand {
    display: flex;
    align-items: center;
}

.brand svg {
    height: 30px;
    margin-right: 10px;
}

.brand svg path {
    fill: var(--pure);
}

.nav-wrapper ul.nav-list {
    list-style-type: none;
    display: flex;
    align-items: center;
}
.nav-wrapper ul.nav-list li {
    margin-left: 30px;
    padding: 20px 0;
    position: relative;
}

.nav-wrapper ul.nav-list li a {
    color: var(--pure);
    text-decoration: none;
    letter-spacing: 1px;
    transition: all .5s ease-in-out;
}

.nav-wrapper ul.nav-list li a:hover, .nav-wrapper ul.nav-list li.active a {
    color: var(--primary);
}

.btn {
    background-color: #933ded;
    color: white;
    outline: none;
    padding: 8px 20px;
    font-size: 14px;
    cursor: pointer;
    letter-spacing: 1px;
    border: 1px solid transparent;
    transition: all .5s ease-in-out;
}

.btn:hover {
    background: transparent;
    border-color: var(--pure);
}

main section.header {
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    margin-top: 160px;
}

main section.header h1 {
    font-size: 36px;
    font-weight: 100;
    text-transform: capitalize;
    margin-bottom: 20px;
}

main section.header h4 {
    font-size: 18px;
    font-weight: 400;
    color: var(--dark-gray);
    margin-bottom: 20px;
}
nav ul.dropdown-list {
    list-style-type: none;
    display: block;
    background: var(--smoke);
    padding: 6px 16px;
    position: absolute;
    width: max-content;
    z-index: 9999;
    left: 50%;
    transform: translateX(-50%);
    opacity: 0;
    pointer-events: none;
}

.nav-wrapper ul.dropdown-list li {
    margin-left: 0;
    padding: 5px 0;
}

.nav-wrapper ul.dropdown-list  li a {
    color: var(--dark);
} 

.nav-wrapper ul.nav-list li:hover .dropdown-list {
    opacity: 1;
    pointer-events: auto;
    animation: moveUp .5s ease-in-out forwards;
}

@keyframes moveUp {
    0% {
        opacity: 0;
        transform: translateX(-50%) translateY(50px);
    }
    100% {
        opacity: 1;
        transform: translateX(-50%) translateY(20px); 
    }
}

.hamburger {
    display: none;
}

.mobile .hamburger {
    display: flex;
    flex-direction: column;
    padding: 20px 0;
    cursor: pointer;
}

.mobile .hamburger span {
    background: var(--pure);
    width: 28px;
    height: 2px;
    margin-bottom: 8px;
}

.mobile ul.nav-list {
    background: -webkit-linear-gradient(45deg, #434343, #000000);
    background: linear-gradient(45deg, #434343, #000000);
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    padding-top: 80px;
    opacity: 0;
    pointer-events: none;
    transition: all .3s ease-in-out;
}

.hamburger, .brand {
    z-index: 9999;
}

.mobile ul.nav-list.open {
    opacity: 1;
    pointer-events: auto;  
}

.mobile .hamburger span {
    transform-origin: left;
    transition: all .3s ease-in-out;
}

.mobile ul.nav-list li a {
    font-size: 20px;
}

.mobile ul.dropdown-list {
    position: relative;
    background: transparent;
    text-align: center;
    height: 0;
    overflow-y: hidden;
    transition: opacity 1s ease-in-out;
    padding-top: 0;
}

.mobile .nav-wrapper ul li:hover .dropdown-list {
    height: max-content;
    padding-top: 6px;
}

.mobile ul.nav-list li {
    margin-left: 0;
    text-align: center;
}

.mobile .nav-wrapper ul.dropdown-list li a {
    color: var(--dark-gray);
}
   </style>
</head>

<body class="mobile">
    <nav>
        <div class="container nav-wrapper">
            <div class="brand" style="color:white;font-size:20px">
                <i class="fa fa-car"></i>
                <span><strong style="color:deepskyblue;font-weight:900">&nbsp; ITFETCH</strong></span>
            </div>
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="nav-list">
                <li class="active">
                    <a href="front.jsp">Home</a>
                </li>
                <li><a href="about.jsp">About</a></li>
                <li>
                    <a href="carrier.jsp">Carrier</a>
                    
                </li>
                <li><a href="#">Q&A</a></li>
                <li><a href="support.jsp">Support</a></li>
                <li>
                    <a href="Registration.jsp" ><button class="btn btn-warning" style="border-radius:20px;color:white;font-weight:700">REGISTRATION</button></a>
                </li>
            </ul>
        </div>
    </nav>
   
   
</body>
<script type="text/javascript">
  window.addEventListener('resize', function(){
    addRequiredClass();
})


function addRequiredClass() {
    if (window.innerWidth < 860) {
        document.body.classList.add('mobile')
    } else {
        document.body.classList.remove('mobile') 
    }
}

window.onload = addRequiredClass

let hamburger = document.querySelector('.hamburger')
let mobileNav = document.querySelector('.nav-list')

let bars = document.querySelectorAll('.hamburger span')

let isActive = false

hamburger.addEventListener('click', function() {
    mobileNav.classList.toggle('open')
    if(!isActive) {
        bars[0].style.transform = 'rotate(45deg)'
        bars[1].style.opacity = '0'
        bars[2].style.transform = 'rotate(-45deg)'
        isActive = true
    } else {
        bars[0].style.transform = 'rotate(0deg)'
        bars[1].style.opacity = '1'
        bars[2].style.transform = 'rotate(0deg)'
        isActive = false
    }
    

})
</script>
</html>