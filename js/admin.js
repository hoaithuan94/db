import { db, answerListCallback } from "./init.js";
import { collection, doc, getDocs, getDoc, setDoc, deleteDoc, writeBatch, query, onSnapshot } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-firestore.js";


const max_ans_input = document.getElementById('max_ans_input');
const post_btn = document.getElementById('postButton');
const rmRank_btn = document.getElementById('rmRank');
const rmQues_btn = document.getElementById('rmQues');

const ques = query(collection(db, 'key'));
onSnapshot(ques, (snapshot) => {
  snapshot.forEach((doc) => {
    const key = doc.data().key;
    Swal.fire({
        title: "Enter your password!",
        text: "Please type a password at least 6 characters.",
        input: 'password',
        showCancelButton: true,
        allowEscapeKey : false,
        allowOutsideClick: false       
    }).then((result) => {
        if (result.value) {
             const hashedPassword = CryptoJS.SHA256(result.value).toString();
             if (hashedPassword == key) {
                post_btn.disabled   = false;
                rmRank_btn.disabled = false;
                rmQues_btn.disabled = false;
               
                answerListCallback(handleAnswerListCallback);
             }
        }
    });
  });
});


function handleAnswerListCallback(newAnswerList) {
  let answerList = newAnswerList;
  const boxes = document.querySelectorAll('.box');
  boxes.forEach(box => {
    box.addEventListener('click', async (e) => {

      const docRef = doc(db, 'users', box.id);
      const docSnap = await getDoc(docRef);
      let currentScore = docSnap.exists() ? docSnap.data().score || 0 : 0;

      if (box.style.backgroundColor === 'lightgreen') {
        box.style.backgroundColor = 'white';
        currentScore = Math.max(currentScore - 0.1, 0);
      } else {
        box.style.backgroundColor = 'lightgreen';
        currentScore += 0.1;
      }
      await setDoc(docRef, { name: box.dataset.value, score: currentScore.toFixed(1) });
      
    });
  });
}

post_btn.addEventListener('click', async (e) => {
  e.preventDefault();

  const text    = quest_input.value.trim();
  const max_ans = max_ans_input.value.trim()

  if(text.trim()){
    await setDoc(doc(db, 'question', '1'), { text: text, max_ans: max_ans});
    Swal.fire({
          icon: "success",
          title: "Đã đăng câu hỏi.",
          timer: 1500
        });
  }
});


rmQues_btn.addEventListener('click', async (e) => {
  e.preventDefault();
    const batch = writeBatch(db);
    const q1 = await getDocs(collection(db, 'answers'));
    const q2 = await getDocs(collection(db, 'question'));
    q1.forEach(doc => {batch.delete(doc.ref);});
    q2.forEach(doc => {batch.delete(doc.ref);});
    await batch.commit();   
    Swal.fire({
          icon: "success",
          title: "Question cleared.",
          timer: 1500
        });
});

rmRank_btn.addEventListener('click', async (e) => {
  e.preventDefault();
    const batch = writeBatch(db);
    const q = await getDocs(collection(db, 'users'));
    q.forEach(doc => {batch.delete(doc.ref);});
    await batch.commit();
    Swal.fire({
          icon: "success",
          title: "Ranking cleared.",
          timer: 1500
        });
});
