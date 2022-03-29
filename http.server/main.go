package main

import "net/http"
import "log"
import "strconv"
import "strings"

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("httpserver v1"))
	})
	http.HandleFunc("/bye", sayBye)
	log.Println("Starting v1 server ...")
	log.Fatal(http.ListenAndServe(":1210", nil))
}

func sayBye(w http.ResponseWriter, r *http.Request) {
	//w.Write([]byte("bye bye ,this is v1 httpServer"))

	//var response = generic.ResponseVO{}
	//contentType := ctx.Request.Header.Get("content-type")
	contentType := r.Header.Get("content-type")
	if !strings.Contains(contentType, "multipart/form-data") {
		//LOG.Warnf("content-type: %s ,does not include multipart/form-data", contentType)
		log.Println("content-type: " + contentType + ",does not include multipart/form-data")
		//ctx.JSON(http.StatusOK, response.GetResponseVO(CODE_ERR, "content-type should be multipart/form-data", empty))
		return
	}

	maxbytes := int64(5242880)
	less := strconv.FormatInt(maxbytes/1048576, 10)
	//ctx.Request.Body = http.MaxBytesReader(ctx.Writer, ctx.Request.Body, maxbytes)
	//if err := ctx.Request.ParseMultipartForm(maxbytes); err != nil {
	if err := r.ParseMultipartForm(maxbytes); err != nil {
		//LOG.Error(err)
		log.Println(err)

		//ctx.JSON(http.StatusOK, response.GetResponseVO(CODE_ERR, "file size must be less than "+less+"m", empty))
		log.Println("file size must be less than " + less + "m")
		return
	}

}
