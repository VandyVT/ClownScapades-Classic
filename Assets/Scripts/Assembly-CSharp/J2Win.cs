using System;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x02000034 RID: 52
public class J2Win : MonoBehaviour
{
	// Token: 0x060000DF RID: 223 RVA: 0x00002188 File Offset: 0x00000388
	private void Start()
	{
	}

	// Token: 0x060000E0 RID: 224 RVA: 0x00004764 File Offset: 0x00002964
	private void Update()
	{
		if (Input.GetKeyDown(KeyCode.J))
		{
			SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
		}
		if (Input.GetKeyDown(KeyCode.K))
		{
			GameObject.Find("Player").GetComponent<Score>().currentScore = 11;
		}
	}
}
