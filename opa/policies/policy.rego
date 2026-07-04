package kubernetes.admission

# On vérifie si un conteneur a une variable d'environnement 
# dont la valeur contient des chaînes suspectes (ex: "password", "secret")
deny[msg] if {
    input.kind == "Pod"
    some container in input.spec.containers
    some env in container.env
    
    # Condition : on cherche si 'password' ou 'secret' est dans la valeur
    val := lower(env.value)
    contains(val, "secret")
    
    msg := sprintf("Le conteneur %s contient une variable d'environnement avec une valeur sensible ('%s').", [container.name, env.value])
}
