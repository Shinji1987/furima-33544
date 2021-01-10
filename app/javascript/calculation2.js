function calculation2 (){
  const itemPrice = document.getElementById("item-price")
  const profit = document.getElementById("profit")
  
  itemPrice.addEventListener('input', function(){
    const price = itemPrice.value
    value = price * 0.9
    profit.innerHTML = value
  })
}

window.addEventListener('load', calculation2);