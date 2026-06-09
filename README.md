# neo4j-training-mns

## Commandes
```bash
docker compose up -d --build
```

## Puis ouvre :

```bash
http://localhost:7474
```

## Login :

```bash
http://localhost:7474
```

- user: neo4j
- password: password123456

## Pour arrêter :

```bash
docker compose down
```

## Pour reset complètement la base :

```bash
docker compose down -v
```

## Commande Cypher pour l'exercice

```cypher
// Dataset
MERGE (alice:Person {name:'Alice'})
MERGE (bob:Person {name:'Bob'})
MERGE (chloe:Person {name:'Chloé'})
MERGE (neo4jBook:Product {name:'Neo4j Book'})
MERGE (dockerBook:Product {name:'Docker Book'})
MERGE (alice)-[:BOUGHT]->(neo4jBook)
MERGE (bob)-[:BOUGHT]->(neo4jBook)
MERGE (bob)-[:BOUGHT]->(dockerBook)
MERGE (chloe)-[:BOUGHT]->(dockerBook);

// Recommandation simple
MATCH (me:Person {name:'Alice'})-[:BOUGHT]->(p:Product)<-[:BOUGHT]-(other:Person)-[:BOUGHT]->(rec:Product)
WHERE NOT (me)-[:BOUGHT]->(rec)
RETURN rec.name AS recommendation, count(*) AS score
ORDER BY score DESC;
```
