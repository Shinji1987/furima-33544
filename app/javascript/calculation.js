function calculation (){
  const itemPrice = document.getElementById("item-price")
  const taxPrice = document.getElementById("add-tax-price")
  

  itemPrice.addEventListener('input', function(){
    const price = itemPrice.value
    taxPrice.innerHTML = Math.floor(price * 0.1)
  })
}

window.addEventListener('load', calculation);