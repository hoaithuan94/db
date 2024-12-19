import { db } from "js/init.js";
import {collection, doc, addDoc, getDocs, setDoc, deleteDoc, serverTimestamp, onSnapshot, query } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-firestore.js";



const mssv_input = document.getElementById('mssv');
const answer_input = document.getElementById('answer_input');
const question = document.getElementById('question');
const sent_btn = document.getElementById('sentButton');
const stt = document.getElementById('stt');

let count = 0;


const mssv_saved = localStorage.getItem("mssv");
if (mssv_saved) {
  mssv_input.value = mssv_saved;
}


const ref_answers = collection(db, 'answers');
const ref_questions= collection(db, 'questions');

const ques = query(ref_questions);
onSnapshot(ques, (snapshot) => {
  snapshot.forEach((doc) => {
    question.innerHTML = doc.data().text;

  });
});



sent_btn.addEventListener('click', async (e) => {
  e.preventDefault();

  const mssv = mssv_input.value.trim();
  const text = answer_input.value.trim()

  if(count < 100){
    if (mssv && text) {
        answer_input.value = '';
        stt.innerHTML = "Bạn đã gửi câu trả lời cho câu hỏi này.";
        sent_btn.disabled = true;
        localStorage.setItem("mssv", mssv);
        await addDoc(ref_answers, {
            id: mssv,
            text,
            timestamp: serverTimestamp(),
          });
      }
      else
        stt.innerHTML = "Nội dung không đầy đủ!";
  }else
    stt.innerHTML = "Đã hết lượt!";


});




answer_input.addEventListener("paste",function(e) {
  //e.preventDefault();
});
