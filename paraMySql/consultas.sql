
# Categorias PADRE

SELECT titulo
FROM ITMT_I JOIN ITMT ON ITMT.id = ITMT_I.id
WHERE ITMT_I.id_idioma = 0
AND ITMT.id_anterior NOT IN (
    SELECT ID FROM ITMT_I
    )