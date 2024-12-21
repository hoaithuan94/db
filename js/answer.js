import {
    db,
    answerListCallback
} from "./init.js";
import {
    collection,
    doc,
    addDoc,
    getDocs,
    setDoc,
    deleteDoc,
    serverTimestamp,
    onSnapshot,
    query
} from "https://www.gstatic.com/firebasejs/11.1.0/firebase-firestore.js";


const mssv_input = document.getElementById('mssv');
const hoten_input = document.getElementById('hoten');
const answer_input = document.getElementById('answer_input');
const question = document.getElementById('question');
const sent_btn = document.getElementById('sentButton');

let answerList = [];
let max_ans = 0;

const mssv_saved = localStorage.getItem("mssv");
const hoten_saved = localStorage.getItem("hoten");
if (mssv_saved)
    mssv_input.value = mssv_saved;

if (hoten_saved)
    hoten_input.value = hoten_saved;


function handleAnswerListCallback(newAnswerList) {
    answerList = newAnswerList;
}

answerListCallback(handleAnswerListCallback);

const ques = query(collection(db, 'question'));
question.innerHTML = 'Hiện chưa có câu hỏi nào!';
onSnapshot(ques, (snapshot) => {
    snapshot.forEach((doc) => {
        question.innerHTML = doc.data().text;
        max_ans = parseInt(doc.data().max_ans);
    });
});


sent_btn.addEventListener('click', async (e) => {
    e.preventDefault();

    const mssv = mssv_input.value.trim();
    const hoten = hoten_input.value.trim()
    const text = answer_input.value.trim()

    if (answerList.length < max_ans) {
        if (mssv && text) {

            if (answerList.includes(mssv)) {
                Swal.fire({
                    icon: "warning",
                    title: "Bạn đã trả lời câu hỏi này rồi!"
                });
            } else {
                answer_input.value = '';
                Swal.fire({
                    icon: "success",
                    title: "Gửi câu trả lời thành công!",
                    timer: 1500
                });
                localStorage.setItem("mssv", mssv);
                localStorage.setItem("hoten", hoten);
                await addDoc(collection(db, 'answers'), {
                    id: mssv,
                    name: hoten,
                    text,
                    timestamp: serverTimestamp(),
                });
            }

        } else
            Swal.fire({
                icon: "warning",
                title: "Nội dung không đầy đủ!"
            });
    } else
        Swal.fire({
            icon: "error",
            title: "Đã hết lượt nhận câu trả lời!"
        });
});



answer_input.addEventListener("paste", function(e) {
    //e.preventDefault();
});
