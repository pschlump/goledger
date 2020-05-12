package main

import (
	"github.com/pschlump/goledger/api"
	log "github.com/pschlump/golog"
)

func secondpass(db api.Datastorer) error {
	log.Debugf("secondpass\n")
	if err := db.Secondpass(); err != nil {
		log.Errorf("%v\n", err)
		return err
	}
	return nil
}
