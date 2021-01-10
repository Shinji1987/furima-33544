function calculation (){
  const itemPrice = document.getElementById("item-price")
  const taxPrice = document.getElementById("add-tax-price")
  

  itemPrice.addEventListener('input', function(){
    const price = itemPrice.value
    value = price * 0.1
    taxPrice.innerHTML = value
  })
}

window.addEventListener('load', calculation);