// Copyright 2021 Harran Ali <harran.m@gmail.com>. All rights reserved.
// Use of this source code is governed by MIT-style
// license that can be found in the LICENSE file.

package http

import (
	"github.com/gocondor/core/routing"
	"github.com/jserranojunior/sefro/backgo/http/handlers"
	"github.com/jserranojunior/sefro/backgo/http/middlewares"
)

// RegisterRoutes to register your routes
func RegisterRoutes() {
	router := routing.Resolve()

	//Define your routes here
	router.Post("/user", middlewares.CORSMiddleware, handlers.UserCreate)
	router.Get("/user", middlewares.CORSMiddleware, middlewares.VerifyJwt, handlers.GetUser)
	router.Get("/admin/users", middlewares.CORSMiddleware, middlewares.VerifyJwt, handlers.GetAllUsers)
	router.Put("/admin/users/:id", middlewares.CORSMiddleware, middlewares.VerifyJwt, handlers.UserUpdate)

	router.Get("/useracl", middlewares.CORSMiddleware, middlewares.VerifyJwt, handlers.GetUserAcl)
	router.Get("/admin/aclroutes/:id", middlewares.CORSMiddleware, handlers.GetAclRoutes)


	router.Get("/", handlers.HomeShow)

	
			router.Post("/login", middlewares.CORSMiddleware, handlers.AuthLogin)
	

	

	financial := router.Group("/financial/")
	// financial.Use(middlewares.VerifyJwt, middlewares.CORSMiddleware())
	{
		financial.Get("/categorias", middlewares.VerifyJwt, handlers.SelectCategoriesBilsToPay)
		financial.Get("/categoriasall", middlewares.VerifyJwt, handlers.SelectAllCategoriesBillsToPay)
		financial.Get("/viewcategories/:dataanomes", middlewares.VerifyJwt, handlers.GetCategoriesAndBillsMonth)
		// Bills to pay
		financial.Get("/contasall", middlewares.VerifyJwt, handlers.SelectAllBillsToPay)
		financial.Get("/editbills/:id/:dataanomes", middlewares.VerifyJwt, handlers.EditBillsToPayMonth)
		financial.Post("/billstopay", middlewares.VerifyJwt, handlers.StoreBillsToPay)
		financial.Put("/billstopay/:id/:dataanomes", middlewares.VerifyJwt, handlers.UpdateBillsToPay)
		financial.Post("/paidbills", middlewares.VerifyJwt, handlers.StorePaidBills)
		financial.Delete("/paidbills/:id", middlewares.VerifyJwt, handlers.DeletePaidBills)
		financial.Get("/paidbills/:id", middlewares.VerifyJwt, handlers.EditPaidBills)
	}

}
