const calculatePrice = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) {
    return; // ページによっては要素が無いのでガード
  }

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    // 手数料計算 (10%)
    const addTaxPrice = Math.floor(inputValue * 0.1);
    // 利益計算
    const profit = Math.floor(inputValue - addTaxPrice);

    // 出力
    const taxElement = document.getElementById("add-tax-price");
    const profitElement = document.getElementById("profit");
    taxElement.innerHTML = isNaN(addTaxPrice) ? "" : addTaxPrice;
    document.getElementById("profit").innerHTML = isNaN(profit) ? "" : profit;
  });
};

window.addEventListener('turbo:load', calculatePrice);
window.addEventListener('turbo:render', calculatePrice);