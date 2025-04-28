4.1 Page blanche = contexte

Schéma + contexte global avec du kube on prem

4.2 Définition de disponiblité = capacité à accéder à la plateforme au moment ou on le souhaite, redondance = panne sur une premier site pour permettre l'accès, notion de haute dispo, différentes stratégie (actif/passif avec sauvegarde ou miroir, ajouter des schéma)

Répartition charge - actif actif - autre schéma : partage de ressources (pool) sur les 2 sites. En cas de panne, le second peut récupérer charge du premier site et assurer service A

Terminologie : pour les contextes dont nous allons parler, nous sommes partis sur une stratégie "stretched cluster". Cad que nous avons un cluster k8s réparti sur deux sites en mode actif/actif.

Multi cluster = alternatives (1 cluster par zone)

5. A replacer en 4.1 (peut-être à renommer ?) => A renommer en "Maintenant u'on parle la même de la même chose, qu'est-ce qu'il estposible de faire ?"

(Parler hyperviseur)

6 : mono CP. 1 control plane pour notre cluster, 1 vm CP sur un des 2 sites. Redondacne à la VMWare (VRA ??) snapshot de la VM, on remonte de l'autre côté

Présenter 3/0, sans parler d'ETCD RAFt, et besoin de CP sur les 2 côtéd pour API haute dispo car opérateur qui met à jour services / pas de bascule auto VMWare car pas licence pour mon projet et aç créé problème supplémentaire, car mes opératurs ne peuvent pas metre à jour les services / ...

Openshift => multi CP, obligatoire 3 CP. 2/1 ? 3/0 ? => Pour faire du 2/1, est-ce que c'eset possible ?

Présentation ETCD, clé baleur, etat de k8s, schéma à ajouter. Comment gérer les membres cluster ?

Raft : Algo d'leection de leader dans ETCD. En cas de panne, comment gérer les pannes ? Schéma et illustrer

8.3 => 2.1 => Soucis avec /ETCD RAFT.

Screenshot de crash election membre voir schéma RAFT.

Redondance => a virer, on réintègre si besoin plus tard.

Recovery : ETCD crash, comment on récupère ? Snapshot d'une dernière VM / soit backup ETCD (avec recréation d'un nouveau quorum mono et intégration des autres membres) => Schéma !

Topology nodes => tagger noeud region

Lien : impact sur applications.

partir de solution naive vers proposition solution

elastic proba auto-eleection + configuration topic elastic

Kafka a revoir avec parler Kafka Kaft / Zooepeeker historique à aller creuser, parler du min in sync pour attention à pas perte données broker

Conclusion : infra, redondcance modèle étendu sur 2 sites, pas aussi simple que pour une VM / BDD . ETcd adresse redondances des CP Kube mis apporte complexité sur 2 sites, il faut être vigilant. Se retrouve aussi côté applicatif avec attention applicatif

Résumé : cluster kube etendu sur 2 sites, oui si bascule auto hypeviseur VM recovery du site A vers B et que vous ayez un stockagfe hyperconvergé. Sinon, pas forcément recommandé. ET dans ce cas, on fait quio ?

Schéma CP externe sur 3ème zone. Oui 3 zones carrément ! C'est pas pour rien que l'on recommande 3 zones partout !

Retrouver projet ou 3ème zone dans VM dédié ?

OUVERTURE :

Multi cluster, et chaque cluster est sur chaque zone. avec meta cluster en administration (schéma / liens / images) : CGP Anthos: redhat advanced cluster management / submariner spinacher multi cluster / pl

(kro ? À valider, car peut-être pas pertinent dans le contexte)

Modèle edge : on a un mini cluster au plus

Stockage part

// Global : lien vers docs

[https://www.spectrocloud.com/blog/two-node-ha-kubernetes-for-edge-computing-cost-savings](https://www.spectrocloud.com/blog/two-node-ha-kubernetes-for-edge-computing-cost-savings "https://www.spectrocloud.com/blog/two-node-ha-kubernetes-for-edge-computing-cost-savings")  
[https://thenewstack.io/a-new-approach-to-two-site-ha-failover-with-k8s-and-kubevirt/?utm_source=tldrdevops](https://thenewstack.io/a-new-approach-to-two-site-ha-failover-with-k8s-and-kubevirt/?utm_source=tldrdevops "https://thenewstack.io/a-new-approach-to-two-site-ha-failover-with-k8s-and-kubevirt/?utm_source=tldrdevops")

Administration | etcd qui explique les différentes configuration et la tolérance à la panne correspondante.  
FAQ | etcd notamment la 3e question qui précise que l'algo utilisé est raft.  
Raft Consensus Algorithm le site de l'algo en question avec des animations qui présentent bien le fonctionnement.

[https://une-tasse-de.cafe/blog/talos-capi-proxmox/](https://une-tasse-de.cafe/blog/talos-capi-proxmox/ "https://une-tasse-de.cafe/blog/talos-capi-proxmox/")

## 

attention, "sujet simple"

haute dispo,

redondance on dégage et on fusionne

mono CP ATTENTION? pas parlé de hypersiveur sans replication dans mono CP

mutli CP ajout de N/2 a schématiser dans la slide

rajout de notes

côté discussion à prendre  
  
ajouter les notes dans les speakers notes !!  
  
oui, c'est une base clé valeur  
  
2 slides sur ETCD, séparé pour le mode fail stop - JS à ajouter GIF  
  
tu dis pas notion de suiveur / leader dansla présentation etcd, faut le préciser sinonn la transition est compliuquée  
  
follower failure : illustration !!  
  
leader faiuyre  : illustration !!  
  
leader failure : ecriture non commité = perdue image perdue !!  
When the majority members of the cluster fail, the etcd cluster fails and cannot accept more writes.

The etcd cluster can only recover from a majority failure once the majority of members become available. If a majority of members cannot come back online, then the operator must start disaster recovery to recover the cluster.

Once a majority of members works, the etcd cluster elects a new leader automatically and returns to a healthy state. The new leader extends timeouts automatically for all leases. This mechanism ensures no lease expires due to server side unavailability.

transition au top entre majore failure et network <> split brain : image / schéma!! split brain à faire figurer sur la slide

falure during bootstrap : image / shcéma arbre à faire !! Partie pas fluide, à,fluidifier  
  
revoery : a fusionner avec majority failure : schéma à ajouter  
  
elastic : TODO  
  
Kafka : schéma à faire  
  
conclusion : à fluidifier revoir, trop de blabla  
  
alternatives :   
  
  
51min

