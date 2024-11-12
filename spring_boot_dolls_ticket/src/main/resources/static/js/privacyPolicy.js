/**
 * 
 */
 
document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector("#form__wrap");
  const checkAll = document.querySelector("#checkAll");
  const checkBoxes = document.querySelectorAll(".input__check input");
  const submitButton = document.querySelector("button");

  const agreements = {
    termsOfService: false,
    privacyPolicy: false,
    allowPromotions: false
  };

  form.addEventListener("submit", (e) => {
  // e.preventDefault(); 
});

  checkBoxes.forEach((item) => item.addEventListener("input", toggleCheckbox));

  function toggleCheckbox(e) {
    const { checked, id } = e.target;
    agreements[id] = checked;
    this.parentNode.classList.toggle("active");
    checkAllStatus();
    toggleSubmitButton();
  }

  function checkAllStatus() {
    const { termsOfService, privacyPolicy, allowPromotions } = agreements;
    checkAll.checked = termsOfService && privacyPolicy && allowPromotions;
  }

  function toggleSubmitButton() {
    const { termsOfService, privacyPolicy } = agreements;
    submitButton.disabled = !(termsOfService && privacyPolicy);
  }

  checkAll.addEventListener("click", (e) => {
    const { checked } = e.target;
    checkBoxes.forEach((item) => {
      item.checked = checked; // 전체 선택/해제
      agreements[item.id] = checked; // 상태 업데이트
      item.parentNode.classList.toggle("active", checked); // 클래스 업데이트
    });
    toggleSubmitButton();
  });
});