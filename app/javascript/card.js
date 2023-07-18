const pay = () => {
  const payjp = Payjp("pk_test_62527c5d12244a155d657681");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    console.log("フォーム送信時にイベンと発火");
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);
