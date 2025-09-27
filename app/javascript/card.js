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
        // エラーが発生した場合、ボタンを再度有効化
        submitButton.disabled = false;
      } else {
        const token = response.id;
        const tokenInput = `<input value=${token} name='token' type="hidden">`;
        form.insertAdjacentHTML("beforeend", tokenInput);
        form.submit(); // トークンを付与してフォームを送信
      }
    });
  });
};

// ページ読み込み時に実行
document.addEventListener("DOMContentLoaded", pay);