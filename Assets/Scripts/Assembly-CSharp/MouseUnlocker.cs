using System;
using UnityEngine;

// Token: 0x0200001D RID: 29
public class MouseUnlocker : MonoBehaviour
{
	// Token: 0x06000076 RID: 118 RVA: 0x0000376C File Offset: 0x0000196C
	private void Start()
	{
		Cursor.visible = true;
		Cursor.lockState = CursorLockMode.None;
	}

	// Token: 0x06000077 RID: 119 RVA: 0x0000376C File Offset: 0x0000196C
	private void Update()
	{
		Cursor.visible = true;
		Cursor.lockState = CursorLockMode.None;
	}
}
