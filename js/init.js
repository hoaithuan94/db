import { initializeApp } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-app.js";
import { getFirestore, collection, doc, onSnapshot, query, orderBy } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-firestore.js";

const firebaseConfig = {
apiKey: "AIzaSyAjIZdSKHn1ru_QEZJ1jvzQlVnziXgLbG8",
authDomain: "answer-gdu.firebaseapp.com",
projectId: "answer-gdu",
storageBucket: "answer-gdu.firebasestorage.app",
messagingSenderId: "804480278025",
appId: "1:804480278025:web:30d3d01472168485c4a2d8",
measurementId: "G-V3MQD3TXVQ"
};

const keywords = ['DATABASE','DATABASES', 'SHOW', 'USE', 'TRUNCATE',  'PROC', 'MODIFY', 'INDEX', 'CONSTRAINT', 'REFERENCES', 'CALL', 'OUTPUT', 'WHILE', 'DO', 'FOR', 'DECLARE', 'PRIMARY', 'KEY', 'NOT', 'NULL', 'CHECK', 'AUTO_INCREMENT', 'RETURN', 'RETURNS', 'FUNCTION', 'RENAME', 'START', 'SAVEPOINT', 'SAVE', 'CURSOR', 'FETCH', 'OPEN', 'CLOSE', 'TOP', 'ROWNUM','PRINT','USER','FORMAT','CHAR_LENGTH','CONCAT_WS', 'DISTINCT','FOREIGN','TINYINT','DATEDIFF','GETDATE','CURRENT_','SESSION_', 'DATABASES','IF','IS','INT','OUT','SMALLINT','CHAR','VARCHAR','DECIMAL','DATETIME','DATE','FLOAT','MONEY', 'BIT', 'DATEDIFF','FOR','AFTER','PROCEDURE','STRCMP', 'LENGTH','NVARCHAR','PERCENT','LOGIN','WITH','PASSWORD','REVERT','GO', 'TO', 'OPTION', 'DENY','CONCAT','REPLACE','SELECT','WHERE','ALTER','TABLE','ADD','DELETE','INSERT','UPDATE','DROP','GROUP BY','HAVING','ORDER BY','LIMIT','ASC','DESC','LIKE','IN','BETWEEN','AND','OR','EXISTS','MIN','MAX','AVG','USING','JOIN','INNER','LEFT','RIGHT','OUTER','UNION','AS','TRIGGER','SET','LIMITER'];


const app = initializeApp(firebaseConfig);
const db = getFirestore(app);


const answer_list = document.getElementById('answerList');



const ref_answers = collection(db, 'answers');


const ans = query(ref_answers, orderBy('timestamp'));
onSnapshot(ans, (snapshot) => {

  answer_list.innerHTML = '';
  snapshot.forEach((doc) => {

    const answer = doc.data();
    const e = document.createElement('div');
    const id = answer.id;
    let text = answer.text;

    keywords.forEach((keyword, index) => {
      const regex_key = new RegExp(`\\b${keyword}\\b`, "gi");
      text = text.replace(regex_key, `<span class="keyword">${keyword}</span>`);
    });

    const regex_str = /([']).*?\1/g;
    text = text.replace(regex_str, (match, p1, p2) => {
          return `<span style="color: orange;">${match}</span>`;
    });

    e.innerHTML = '<div class="box"><div class="label">-- '+id+'</div>'+text+'</div>';
    answer_list.prepend(e.firstChild);

  });
});


export { db };




