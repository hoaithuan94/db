import { initializeApp } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-app.js";
import {
    getFirestore,
    collection,
    doc,
    getDoc,
    onSnapshot,
    query,
    orderBy,
    limit
} from "https://www.gstatic.com/firebasejs/11.1.0/firebase-firestore.js";

const firebaseConfig = {
    apiKey: "AIzaSyAjIZdSKHn1ru_QEZJ1jvzQlVnziXgLbG8",
    authDomain: "answer-gdu.firebaseapp.com",
    projectId: "answer-gdu",
    storageBucket: "answer-gdu.firebasestorage.app",
    messagingSenderId: "804480278025",
    appId: "1:804480278025:web:30d3d01472168485c4a2d8",
    measurementId: "G-V3MQD3TXVQ"
};

const keywords = ['DATABASE', 'DATABASES', 'SHOW', 'USE', 'TRUNCATE', 'PROC', 'MODIFY', 'INDEX', 'CONSTRAINT', 'REFERENCES', 'CALL', 'OUTPUT', 'WHILE', 'DO', 'FOR', 'DECLARE', 'PRIMARY', 'KEY', 'NOT', 'NULL', 'CHECK', 'AUTO_INCREMENT', 'RETURN', 'RETURNS', 'FUNCTION', 'RENAME', 'START', 'SAVEPOINT', 'SAVE', 'CURSOR', 'FETCH', 'OPEN', 'CLOSE', 'TOP', 'ROWNUM', 'PRINT', 'USER', 'FORMAT', 'CHAR_LENGTH', 'CONCAT_WS', 'DISTINCT', 'FOREIGN', 'TINYINT', 'DATEDIFF', 'GETDATE', 'CURRENT_', 'SESSION_', 'DATABASES', 'IF', 'IS', 'INT', 'OUT', 'SMALLINT', 'CHAR', 'VARCHAR', 'DECIMAL', 'DATETIME', 'DATE', 'FLOAT', 'MONEY', 'BIT', 'DATEDIFF', 'FOR', 'AFTER', 'PROCEDURE', 'STRCMP', 'LENGTH', 'NVARCHAR', 'PERCENT', 'LOGIN', 'WITH', 'PASSWORD', 'REVERT', 'GO', 'TO', 'OPTION', 'DENY', 'CONCAT', 'REPLACE', 'SELECT', 'WHERE', 'ALTER', 'TABLE', 'ADD', 'DELETE', 'INSERT', 'UPDATE', 'DROP', 'GROUP BY', 'HAVING', 'ORDER BY', 'LIMIT', 'ASC', 'DESC', 'LIKE', 'IN', 'BETWEEN', 'AND', 'OR', 'EXISTS', 'MIN', 'MAX', 'AVG', 'USING', 'JOIN', 'INNER', 'LEFT', 'RIGHT', 'OUTER', 'UNION', 'AS', 'TRIGGER', 'SET', 'LIMITER'];


const app = initializeApp(firebaseConfig);
const db = getFirestore(app);


const answer_list = document.getElementById('answerList');
const ranking_list = document.getElementById('rankingList');


const q = query(collection(db, 'ranking'), orderBy('score', 'desc'));
onSnapshot(q, (snapshot) => {
    let i = 0;
    ranking_list.innerHTML = '';
    snapshot.forEach((doc) => {
        i++;
        const id = doc.id;
        const name = doc.data().name;
        const score = doc.data().score;

        const e = document.createElement('div');
        e.innerHTML = '<li id="' + id + '"><span class="rank" >' + i + '</span><span class="name">' + name + ' - ' + id + '</span><span class="score">+' + score + ' điểm</span></li>'
        ranking_list.append(e);

    });

    const ranks = ranking_list.querySelectorAll('li');
    ranks.forEach(rank => {
        rank.addEventListener('click', async (e) => {

            const docSnap = await getDoc(doc(db, 'users', rank.id));

            if (docSnap.exists()) {
                Swal.fire({
                    title: "Xin chào!",
                    text: "Tổng điểm đã tích lũy của "+docSnap.data().name+" là " + docSnap.data().score + " điểm.",
                    icon: "info"
                });

            } else
                console.log("Không tìm thấy user " + rank.id);

        });

    });

});


const ref_answers = collection(db, 'answers');
export function answerListCallback(callback) {
    const ansQuery = query(ref_answers, orderBy('timestamp'));
    onSnapshot(ansQuery, (snapshot) => {
        answer_list.innerHTML = '';
        const answer_mssv = [];
        const callbacks = [];
        snapshot.forEach((doc) => {

            const e = document.createElement('div');
            const answer = doc.data();
            const id = answer.id;
            const name = answer.name;
            let text = answer.text;

            answer_mssv.push(id);

            callbacks.forEach((cb) => cb(answer_mssv));

            keywords.forEach((keyword, index) => {
                const regex_key = new RegExp(`\\b${keyword}\\b`, "gi");
                text = text.replace(regex_key, `<span class="keyword">${keyword}</span>`);
            });

            const regex_str = /([']).*?\1/g;
            text = text.replace(regex_str, (match, p1, p2) => {
                return `<span style="color: orange;">${match}</span>`;
            });

            e.innerHTML = '<div class="box" id="' + id + '" data-value="' + name + '"><div class="label">-- ' + id + ' ' + name + '</div>' + text + '</div>';
            answer_list.prepend(e.firstChild);

        });
        callback(answer_mssv);
    });
}



export { db };
