const pay = () => {
  const publicKey = gon.public_key
  const payjp = Payjp(publicKey) // PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');
  const form = document.getElementById('charge-form')

  form.addEventListener("submit", (e) => {
    e.preventDefault(); // デフォルトのフォーム送信をキャンセル

    // 購入ボタンを無効化して二重送信を防ぐ
    const submitButton = document.getElementById("button");
    submitButton.disabled = true;

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenInput = `<input value=${token} name='token' type="hidden">`;
        form.insertAdjacentHTML("beforeend", tokenInput);
      }
        // 入力欄をクリア
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();

      form.submit();
    });
    
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);