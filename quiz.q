/ =========================
/ State
/ =========================
.quiz.state:(
  `score`total`current`order`history!(
    0;          / score
    0;          / total asked
    0;          / current index
    ();         / randomized order
    ()          / history (q;a;correct)
  )
 );

/ =========================
/ Helper: load Q&A
/ =========================
.quiz.loadQA:{
  qs:asc key .question.overloads;
  qs:qs where "q"=last each string qs;
  as:qs ssr["q";"a"];
  (qs;as)
 };

/ =========================
/ Start quiz
/ =========================
.quiz.start:{
  qa:.quiz.loadQA[];
  qs:first qa;
  n:count qs;
  ord:n?til n;

  .quiz.state[`score]:0;
  .quiz.state[`total]:0;
  .quiz.state[`current]:0;
  .quiz.state[`order]:ord;
  .quiz.state[`history]:();

  "Quiz started. Use .quiz.next[] to begin."
 };

/ =========================
/ Ask next question
/ =========================
.quiz.next:{
  idx:.quiz.state[`current];
  ord:.quiz.state[`order];

  if[idx>=count ord;
    : "Quiz complete. Use .quiz.results[]"
  ];

  qa:.quiz.loadQA[];
  qs:first qa;

  qKey:qs ord[idx];
  qVal:value qKey;

  .quiz.state[`current]+:1;
  .quiz.state[`total]+:1;

  show "Question ",string .quiz.state[`total],": ",qVal;
 };

/ =========================
/ Submit answer
/ =========================
.quiz.answer:{[userAns]
  idx:.quiz.state[`current]-1;
  ord:.quiz.state[`order];

  qa:.quiz.loadQA[];
  qs:first qa;
  as:last qa;

  qKey:qs ord[idx];
  aKey:as ord[idx];

  correct:value aKey;

  isCorrect:userAns~correct;

  if[isCorrect;
    .quiz.state[`score]+:1;
    show "✅ Correct!";
  ;
    show "❌ Incorrect.";
    show "Correct answer: ",string correct;
  ];

  / store history
  .quiz.state[`history],:enlist (qKey;userAns;isCorrect);

  show "Score: ",string .quiz.state[`score]," / ",string .quiz.state[`total];
 };

/ =========================
/ Skip question
/ =========================
.quiz.skip:{
  show "Skipped.";
  .quiz.next[];
 };

/ =========================
/ Results summary
/ =========================
.quiz.results:{
  show "Final Score: ",string .quiz.state[`score]," / ",string .quiz.state[`total];
  show "Accuracy: ",string 100f * .quiz.state[`score] % .quiz.state[`total],"%";
 };

/ =========================
/ Review history
/ =========================
.quiz.review:{
  flip `question`yourAnswer`correct!.quiz.state[`history]
 };