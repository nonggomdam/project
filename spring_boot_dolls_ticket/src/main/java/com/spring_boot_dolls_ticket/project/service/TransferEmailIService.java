package com.spring_boot_dolls_ticket.project.service;

import com.spring_boot_dolls_ticket.project.model.TransferEmailMessageVO;

public interface TransferEmailIService {

	void send(TransferEmailMessageVO emailMessage);
}
