package org.acme.rest;

import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;

@Path("/ping-db")
public class DbPingResource {

    @Inject
    EntityManager em;

    @GET
    public String ping() {
        em.createNativeQuery("SELECT 1").getSingleResult();
        return "DB OK";
    }
}