import { db } from "./init.js";
import {collection, doc, getDocs, setDoc, deleteDoc } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-firestore.js";



const post_btn = document.getElementById('postButton');




post_btn.addEventListener('click', async (e) => {
  e.preventDefault();

  const text = quest_input.value.trim();

  if(text.trim()){
    await setDoc(doc(db, 'questions', '1'), { text: text});
    stt.innerHTML = "Đã đăng câu hỏi.";
  }

    
});



let i = 0;
document.getElementById('rm').addEventListener('click', async (e) => {
  e.preventDefault();
  i++; 
  console.log(i);
  if(i % 5 == 0){
     const q = await getDocs(collection(db, 'answers'));
     for (const document of q.docs)
        await deleteDoc(doc(db, 'answers', document.id));
  }
});
