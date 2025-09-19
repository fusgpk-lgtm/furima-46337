document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return; // ページによっては要素が無いのでガード

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    // 手数料計算 (10%)
    const tax = Math.floor(inputValue * 0.1);
    // 利益計算
    const profit = Math.floor(inputValue - tax);

    // 出力
    document.getElementById("add-tax-price").innerHTML = isNaN(tax) ? "" : tax;
    document.getElementById("profit").innerHTML = isNaN(profit) ? "" : profit;
  });
});