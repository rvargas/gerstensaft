package me.rafaelvargas

import org.springframework.dao.DataIntegrityViolationException

class AuditLogController {

    def index() {
        [auditLogInstanceList: AuditLog.list([order:'desc',sort:'dateCreated']), auditLogInstanceTotal: AuditLog.count()]
    }
}
