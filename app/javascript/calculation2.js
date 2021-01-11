function calculation2 (){
  const itemPrice = document.getElementById("item-price")
  const profit = document.getElementById("profit")
  
  itemPrice.addEventListener('input', function(){
    const price = itemPrice.value
    profit.innerHTML = Math.floor(price * 0.9)
  })
}

window.addEventListener('load', calculation2);